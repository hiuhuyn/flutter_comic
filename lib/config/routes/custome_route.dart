import 'package:flutter/material.dart';
import 'package:nettruyen/app/presentaion/pages/home/home_page.dart';
import 'package:nettruyen/app/presentaion/pages/page_not_found.dart';
import 'package:nettruyen/config/routes/routes_name.dart';

class CustomeRoute {
  static PageRoute generate(RouteSettings settings) {
    print("route: ${settings.name}");
    switch (settings.name) {
      case RoutesName.kHomePage:
        return MaterialPageRoute(
            builder: (context) => const HomePage(), settings: settings);
    }
    return MaterialPageRoute(
        builder: (context) => const PageNotFound(), settings: settings);
  }
}
