import 'package:flutter/material.dart';
import 'package:food/features/authentication/screens/login_screen.dart';
import 'package:food/features/authentication/screens/signup_screen.dart';
import 'package:food/screens/add_steps_screen.dart';
import 'package:food/screens/create_recipe_screen.dart';
import 'package:food/screens/dashboard.dart';
import 'package:food/screens/show_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignUpScreen.routename:
      return MaterialPageRoute(builder: (context) => SignUpScreen());

    case LoginScreen.routename:
      return MaterialPageRoute(builder: (context) => LoginScreen());

    case Dashboard.routename:
      return MaterialPageRoute(builder: (context) => Dashboard());

    case AddScreen.routename:
      return MaterialPageRoute(builder: (context) => AddScreen());

    case ShowScreen.routename:
      return MaterialPageRoute(builder: (context) => ShowScreen());

    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Text("Error bruh"),
              ));
  }
}
