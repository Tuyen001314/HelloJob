import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellojob/UserViewModel.dart';
import 'package:hellojob/util/Resource/Resource.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((value){
      var userState = Provider.of<UserState>(context, listen: false);
      userState.getUserFromLocal().then((value) {
        print("when login from local ${userState.currentUser}");
        if(userState.currentUser is Success || userState.currentUser is Failure) {
          Navigator.of(context).pushNamed("/Main");
        }
      });
    });
      return Scaffold(
          body: Container(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    child: Image.asset('assets/images/logo1.png'),
                    height: 75.0,
                  ),
                ),
              ],
            ),
          ) // This trailing comma makes auto-formatting nicer for build methods.
      );
  }
}
