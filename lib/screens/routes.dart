
import 'package:electronics_shop/screens/sign_up_screen/sign_up.dart';
import 'package:electronics_shop/screens/splash_screen/splash_screen.dart';
import 'package:electronics_shop/screens/tabs/tab_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen/login_screen.dart';
import 'on_boarding/on_boarding_screen.dart';
class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return navigate(const SplashScreen());
      case RouteNames.boardingRoute:
        return navigate(const PageViewScreen());
      case RouteNames.tabRoute:
        return navigate(const TabScreen());

      case RouteNames.loginRoute:
        return navigate(const LoginScreen());

      case RouteNames.registerRoute:
        return navigate(const SignUpScreen());

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String splashScreen = "/";
  static const String tabRoute = "/tab_route";
  static const String loginRoute = "/login_route";
  static const String registerRoute = "/register_route";
  static const String boardingRoute = "/boarding_route";
}