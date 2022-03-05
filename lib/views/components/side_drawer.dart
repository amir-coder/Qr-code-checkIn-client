import 'package:bytecraft_checkin/models/user.dart';
import 'package:bytecraft_checkin/views/components/list_element.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  Map<String, User> usersInstance = {};
  SideDrawer({ Key? key, required this.usersInstance}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:ListView.separated(
            itemBuilder: (_, int index){
              User user = widget.usersInstance.values.elementAt(index);
              print(user.toString());
              return ListElement(content:'${user.firstname} ${user.familyname}');
            }, 
            separatorBuilder: (BuildContext context, int index) => const Divider(), 
            itemCount: widget.usersInstance.length,
          )
    );
  }
}

class SideDrawer1 extends StatelessWidget {
  final Map<String, User> usersInstance = {};
  SideDrawer1({ Key? key, required Map<String, User> usersInstance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:ListView.separated(
            itemBuilder: (_, int index){
              User user = usersInstance.values.elementAt(index);
              print('In sideDrawer '+user.toString());
              return ListElement(content:'${user.firstname} ${user.familyname}');
            }, 
            separatorBuilder: (BuildContext context, int index) => const Divider(), 
            itemCount: usersInstance.length,
          )
    );
  }
}