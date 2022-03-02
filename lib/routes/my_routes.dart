import 'package:flutter/material.dart';
import 'package:work/screens/home/my_home_page.dart';

class MyRoutes {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
    }
  }
}
