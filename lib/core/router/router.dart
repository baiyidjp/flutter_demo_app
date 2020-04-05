import 'package:flutter/material.dart';
import 'package:flutter_demo_app/ui/pages/favor/favor.dart';
import 'package:flutter_demo_app/ui/pages/home/home.dart';
import 'package:flutter_demo_app/ui/pages/main/main_page.dart';

class JPRoute {

  static final String initRoute = JPMainPage.route;

  static final Map<String, WidgetBuilder> routes = {

    JPMainPage.route: (context) => JPMainPage(),

    JPHomePage.route: (context) => JPHomePage(),
    JPFavorPage.route: (context) => JPFavorPage(),

  };

  static final RouteFactory generateRoute  = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}