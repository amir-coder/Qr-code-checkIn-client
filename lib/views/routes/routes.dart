import 'package:bytecraft_checkin/views/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:bytecraft_checkin/views/routes/routes_name.dart';
import 'package:bytecraft_checkin/views/screens/screens.dart';

//creating onGenerateRoute method for routing
//the idea is to switch between names of routes and return the corresponding screen


class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      //home
      case AppRoutes.home:
        return _pageSimpleRoute(const HomeScreen(), settings);
      default:
        return _pageSimpleRoute(const HomeScreen(), settings);
    }
  }
}


//Navigation without transition (default)

Route<dynamic> _pageSimpleRoute(Widget page, RouteSettings settings) => PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, _, __) => page,
  );
