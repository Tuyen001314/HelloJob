import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:hellojob/screen/admin/MainScreenAdmin.dart';
import 'package:hellojob/screen/guest/Home.dart';
import 'package:hellojob/state/UserState.dart';
import 'package:hellojob/screen/MainScreen.dart';
>>>>>>> 1463ee96f089d26a30840de6ae5dc449bfdb0ed2
import 'package:hellojob/util/Resource/Resource.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../state/UserState.dart';
import '../../util/ToastExt.dart';
import '../admin/MainScreenAdmin.dart';
import '../guest/Home.dart';

class SignUp extends StatefulWidget {
  static const String ROUTE_NAME = 'SignUp';

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _userName = "";
  String _password = '';

  void register() {
    var userState = Provider.of<UserState>(context, listen: false);
    userState.register(_userName, _password).whenComplete(() {
      var currentUser = userState.currentUser;
      if (currentUser is Failure) {
        toast(currentUser.message!);
        return;
      }
<<<<<<< HEAD
      if (currentUser is Success) {
        print("admin vo");
        Navigator.of(context).popAndPushNamed("/${AdminMainScreen.ROUTE_NAME}");
        return;
      } else {
        print(currentUser.message);
        Navigator.of(context).popAndPushNamed("/${Home.ROUTE_NAME}");
=======
      if(currentUser is Success) {
        if(currentUser.data!.isAdmin()) {
          Navigator.of(context).popAndPushNamed("/${AdminMainScreen.ROUTE_NAME}");
        } else {
          Navigator.of(context).popAndPushNamed("/${MainScreen.ROUTE_NAME}");
        }
>>>>>>> 1463ee96f089d26a30840de6ae5dc449bfdb0ed2
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeTo//AvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16.0, top: 60.0),
                  child: SizedBox(
                    height: 75.0,
                    child: Image.asset('assets/images/ic_brand.png'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(left: 16.0, top: 36.0, bottom: 12),
                  child: const Text(
                    'Đăng Ký',
                    style: TextStyle(
                      fontSize: 24,
                      color: colorSignIn,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16.0, top: 14, right: 16),
                  child: const Text(
                    'Thông tin tài khoản',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
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
                  margin: const EdgeInsets.only(left: 16.0, top: 10, right: 16),
                  child: const TextField(
                    style: TextStyle(
                      fontSize: 15,
                      color: colorTenDangNhap,
                    ),
                    decoration: InputDecoration(
                        labelText: 'Họ tên *',
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
                  margin: const EdgeInsets.only(left: 16.0, top: 6, right: 16),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 15,
                      color: colorTenDangNhap,
                    ),
                    onChanged: (value) {
                      _userName = value;
                    },
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
                  margin: const EdgeInsets.only(left: 16.0, top: 6, right: 16),
                  child: TextField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: TextStyle(
                      fontSize: 15,
                      color: colorTenDangNhap,
                    ),
                    onChanged: (value) {
                      _password = value;
                    },
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
                  margin: const EdgeInsets.only(left: 16.0, top: 6, right: 16),
                  child: TextField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: TextStyle(
                      fontSize: 15,
                      color: colorTenDangNhap,
                    ),
                    decoration: InputDecoration(
                        labelText: 'Xác nhận mật khẩu *',
                        // suffixIcon: IconButton(
                        //     icon: Icon(_isObscure2
                        //         ? FluentSystemIcons.ic_fluent_eye_show_filled
                        //         :  FluentSystemIcons.ic_fluent_eye_hide_filled),
                        //     onPressed: () {
                        //       setState(() {
                        //         _isObscure2 = !_isObscure2;
                        //       });
                        //     }),
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 8))),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16.0, top: 36, right: 16),
                  child: Text(
                    'Thông tin liên hệ',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
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
                  margin: const EdgeInsets.only(left: 16.0, top: 10, right: 16),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 15,
                      color: colorTenDangNhap,
                    ),
                    decoration: const InputDecoration(
                        labelText: 'Số điện thoại *',
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
                  margin: const EdgeInsets.only(left: 16.0, top: 6, right: 16),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 15,
                      color: colorTenDangNhap,
                    ),
                    decoration: const InputDecoration(
                        labelText: 'Email *',
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 8))),
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(left: 16.0, top: 20, right: 16),
              child: Column(
                children: [
                  const SizedBox(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorBGDangNhap,
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: register,
                    child: const Text(
                      'Đăng ký',
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
              margin: const EdgeInsets.only(left: 16.0, top: 5.0),
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
                      const EdgeInsets.only(left: 16.0, top: 6.0, right: 16),
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
