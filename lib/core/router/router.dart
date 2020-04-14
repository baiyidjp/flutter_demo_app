import 'package:flutter/material.dart';
import 'package:flutter_demo_app/ui/pages/favor/favor.dart';
import 'package:flutter_demo_app/ui/pages/home/filter_page.dart';
import 'package:flutter_demo_app/ui/pages/home/home.dart';
import 'package:flutter_demo_app/ui/pages/main/main_page.dart';
import 'package:flutter_demo_app/ui/pages/meal/meal_detail.dart';
import 'package:flutter_demo_app/ui/pages/meal/meal_page.dart';

class JPRoute {

  static final String initRoute = JPMainPage.route;

  static final Map<String, WidgetBuilder> routes = {

    JPMainPage.route: (context) => JPMainPage(),

    JPHomePage.route: (context) => JPHomePage(),
    JPMealPage.route: (context) => JPMealPage(),
    JPMealDetailPage.route: (context) => JPMealDetailPage(),
    JPFavorPage.route: (context) => JPFavorPage(),

  };

  static final RouteFactory generateRoute  = (settings) {
    if (settings.name == JPFilterPage.route) {
      return MaterialPageRoute(
        builder: (context) => JPFilterPage(),
        fullscreenDialog: true
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}