import 'package:bytecraft_checkin/config/colors.dart';
import 'package:bytecraft_checkin/consts.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:bytecraft_checkin/config/config.dart';
import 'package:bytecraft_checkin/views/components/components.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:bytecraft_checkin/models/user.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  //current user
  User _user = User(id: 'ididid', firstname: 'firstname', familyname: 'familyname', email: 'email', checkedIn: false);
  bool _isUserFound = false;

  //list of users
  Map<String, User> users = {};
  //fetching User
  Future<void> fetchUser()async{
    // + '/${result!.code}'
    final response = await http.get(Uri.parse(urlUser));

    if(response.statusCode ==200) {
      final data = jsonDecode(response.body);
      setState(() {
        _user = User.fromJson(data[0]);
        _isUserFound = true;
        users.putIfAbsent(_user.id, () => _user);
      });
      print(users);
    }else{
      //user not found
      setState(() {
        _isUserFound = false;
      });
    }
  }
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ideatech CheckIn'),
        centerTitle: true,
        
      ),
      drawer: SideDrawer(usersInstance: users,),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child:Container(
                color: (result != null)? (_isUserFound)? AppColors.green:AppColors.red :Theme.of(context).bannerTheme.backgroundColor,
                child: FittedBox(

              fit: BoxFit.contain,
              child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      color: (result != null)? (_isUserFound)? AppColors.green:AppColors.red :Theme.of(context).bannerTheme.backgroundColor,
                      child: (result != null)?
                                (_isUserFound)? Text('${_user.firstname} ${_user.familyname}')
                                    :Text('Participant not found!')
                              :
                                const Text('Scan a code'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
      });
      await fetchUser();
      //for testing only
      //print(_user.familyname);
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}


