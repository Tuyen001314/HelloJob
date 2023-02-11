import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hellojob/constants.dart';
import 'package:hellojob/screen/MainScreen.dart';
import 'package:hellojob/screen/auth/SignUp.dart';
import 'package:hellojob/screen/guest/Home.dart';
import 'package:hellojob/state/UserState.dart';
import 'package:hellojob/util/Resource/Resource.dart';
import 'package:provider/provider.dart';

import '../admin/MainScreenAdmin.dart';

class SignIn extends StatefulWidget {
  static const String ROUTE_NAME = 'SignIn';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "";
  bool _isObscure = true;
  var password = "";

  void login() {
    var userState = Provider.of<UserState>(context, listen: false);
    userState.login(email, password).whenComplete(() {
      if (userState.currentUser is Success) {
        if (userState.currentUser.data!.isAdmin()) {
          print("admin vo");
          Navigator.of(context)
              .popAndPushNamed("/${AdminMainScreen.ROUTE_NAME}");
          return;
        } else {
          print("normal vo");
          Navigator.of(context).popAndPushNamed("/${MainScreen.ROUTE_NAME}");
        }
      if (userState.currentUser is Failure) {
        print("normal vo");
          Navigator.of(context).popAndPushNamed("/${MainScreen.ROUTE_NAME}");
        }
      }
      if (userState.currentUser is Failure) {
        print("ko thanh cong");
        Navigator.of(context).popAndPushNamed("/${MainScreen.ROUTE_NAME}");
      }
    });
  }

  void register() {
    Navigator.of(context).pushNamed("/${SignUp.ROUTE_NAME}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16.0, top: 60.0),
                  child: Container(
                    child: Image.asset('assets/images/ic_brand.png'),
                    height: 75.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(left: 16.0, top: 44.0, bottom: 12),
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(
                      fontSize: 24,
                      color: colorSignIn,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 45,
                  margin: const EdgeInsets.only(left: 16.0, top: 24, right: 16),
                  child: TextField(
                    onChanged: (value) {
                      email = value.trim();
                    },
                    style: const TextStyle(
                      fontSize: 15,
                      color: colorTenDangNhap,
                    ),
                    decoration: const InputDecoration(
                        labelText: 'Tên đăng nhập *',
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 8))),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 45,
                  margin: const EdgeInsets.only(left: 16.0, top: 24, right: 16),
                  child: TextField(
                    obscureText: _isObscure,
                    enableSuggestions: false,
                    autocorrect: false,
                    onChanged: (value) {
                      password = value;
                    },
                    style: TextStyle(
                      fontSize: 15,
                      color: colorTenDangNhap,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu *',
                      // suffixIcon: IconButton(
                      //     icon: Icon(_isObscure
                      //         ? FluentSystemIcons.ic_fluent_eye_show_filled
                      //         :  FluentSystemIcons.ic_fluent_eye_hide_filled),
                      //     onPressed: () {
                      //       setState(() {
                      //         _isObscure = !_isObscure;
                      //       });
                      //     }),
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 8)),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(left: 16.0, top: 24, right: 16),
              child: Column(
                children: [
                  const SizedBox(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorBGDangNhap,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: login,
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(
                          fontSize: 15,
                          color: colorTenDangNhap,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              child: Row(children: <Widget>[
                Expanded(child: Divider()),
                Text("     or     "),
                Expanded(child: Divider()),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Image.asset('assets/images/fb_login.png'),
                  height: 42,
                  width: 42,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16.0, top: 10),
                  child: Image.asset('assets/images/gg_login.png'),
                  height: 42,
                  width: 42,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Chưa có tài khoản? ",
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(color: colorDangKy),
                        ),
                        onPressed: register,
                        child: const Text('Đăng ký'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16.0, top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Divider()),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.only(left: 16.0, top: 10.0, right: 16),
                  child: Text(
                    "Copyright © 2021 Công ty Cổ phần HelloJob",
                    style: TextStyle(
                      fontSize: 12,
                      color: colorTenDangNhap,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
