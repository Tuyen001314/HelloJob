import 'package:flutter/material.dart';
import 'package:hellojob/UserViewModel.dart';
import 'package:hellojob/screen/Home.dart';
import 'package:hellojob/screen/splash/SplashScreen.dart';
import 'package:provider/provider.dart';

class Routes {
  static MaterialPageRoute<T>? getRoute<T>(RouteSettings settings) {
    if(settings.name == "/") {
      return MaterialPageRoute(
        builder: (context) => const SplashScreen());
    }
    var params = settings.name!.split('/');
    switch (params[1]) {
      case "Splash":
        return MaterialPageRoute(
            builder: (context) => const SplashScreen());
      case "Home":
        return MaterialPageRoute(
            builder: (context) =>  Home());
      default: return null;
    }
  }
}
