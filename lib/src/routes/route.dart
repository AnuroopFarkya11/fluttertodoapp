
import 'package:flutter/material.dart';
import 'package:fluttertodoapp/src/screen/dashboard/dashboard_screen.dart';
import 'package:fluttertodoapp/src/screen/landing_page.dart';

class AppRoute {
  final String root = '/';
  final String landing = '/landing';
  final String dashBoard = '/dashBoard';
  final String settings = '/settings';

  Map<String, WidgetBuilder> get routes => {
    root : (context)=>const LandingPage(),
    dashBoard : (context)=>const DashBoard()
  };
}
