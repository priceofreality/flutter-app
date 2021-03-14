import 'package:flutter/material.dart';
import 'package:projet4/presentation/pages/error.dart';

class AppRouter {
  final pages = <String, Function>{};

  void define(String path, Function handler) {
    pages[path] = handler;
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    return pages.containsKey(routeSettings.name)
        ? MaterialPageRoute(
            builder: (context) =>
                pages[routeSettings.name!]!(routeSettings.arguments),
          )
        : MaterialPageRoute(builder: (context) => ErrorPage());
  }
}
