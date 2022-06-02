import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gmail/main.dart';
import 'package:gmail/model/email_object.dart';
import 'package:gmail/view/screen/home_page.dart';
import 'package:gmail/view/screen/login_screen.dart';

const String firstRoute = '/';
const String homeRoute = '/home';
const String loginRoute = '/login';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case firstRoute:
        return MaterialPageRoute(builder: (_) => FirstPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case homeRoute:
        var data = settings.arguments as Account;
        return MaterialPageRoute(
            builder: (_) => HomePage(
                  account: data,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

class LoginScreen {}
