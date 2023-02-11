import 'package:flutter/material.dart';
import 'package:hellojob/screen/DetailJob.dart';
import 'package:hellojob/screen/MainScreen.dart';
import 'package:hellojob/screen/admin/MainScreenAdmin.dart';
import 'package:hellojob/screen/admin/job_manage/AddJobScreen.dart';
import 'package:hellojob/screen/admin/job_manage/JobManageScreen.dart';
import 'package:hellojob/screen/auth/SignUp.dart';
import 'package:hellojob/screen/splash/SplashScreen.dart';

import '../model/Job.dart';
import '../screen/admin/job_manage/EditJobScreen.dart';
import '../screen/auth/SignIn.dart';
import '../screen/profile/UpdateProfileScreen.dart';

class Routes {
  static MaterialPageRoute<T>? getRoute<T>(RouteSettings settings) {
    if (settings.name == "/") {
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
    var params = settings.name!.split('/');
    switch (params[1]) {
      case "Splash":
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case MainScreen.ROUTE_NAME:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case SignIn.ROUTE_NAME:
        return MaterialPageRoute(builder: (context) => SignIn());
      case SignUp.ROUTE_NAME:
        return MaterialPageRoute(builder: (context) => const SignUp());
      case JobManageScreen.ROUTE_NAME:
        return MaterialPageRoute(builder: (context) => const JobManageScreen());
      case AdminMainScreen.ROUTE_NAME:
        return MaterialPageRoute(builder: (context) => const AdminMainScreen());
      case DetailJob.ROUTE_NAME:
        var job = settings.arguments as Job;
        return MaterialPageRoute(builder: (context) => DetailJob(job: job));
      case EditJobScreen.ROUTE_NAME:
        var job = settings.arguments as Job;
        return MaterialPageRoute(builder: (context) => EditJobScreen(job: job));
      case AddJobScreen.ROUTE_NAME:
        return MaterialPageRoute(builder: (context) => AddJobScreen());
      case UpdateProfileScreen.ROUTE_NAME:
        return MaterialPageRoute(builder: (context) => UpdateProfileScreen());
      default:
        return null;
    }
  }
}
