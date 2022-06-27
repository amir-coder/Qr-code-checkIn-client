import 'package:flutter/material.dart';
import 'package:bytecraft_checkin/views/routes/routes_name.dart';
import 'package:bytecraft_checkin/views/routes/routes.dart';
import 'package:bytecraft_checkin/config/config.dart';
import 'package:bytecraft_checkin/config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CheckInApp());
}

class CheckInApp extends StatelessWidget {
  const CheckInApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ideatech CheckIn",
      theme: AppTheme.defaultTheme,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
