import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellojob/state/UserState.dart';
import 'package:hellojob/screen/MainScreen.dart';
import 'package:hellojob/util/Resource/Resource.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class SignUp extends StatefulWidget {
  static const String ROUTE_NAME = 'SignUp';

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _userName =  "";

  String _password = '';

  void register() {
    var userState = Provider.of<UserState>(context, listen: false);
    userState.register(_userName, _password).whenComplete(() {
      if(userState.currentUser is Success) {
        Navigator.of(context).popAndPushNamed("/Main");
      } else {
        print(userState.currentUser.message);
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
                    child: Image.asset('assets/images/Group1.png'),
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
                    style: TextStyle(
                      fontSize: 15,
                      color: colorTenDangNhap,
                    ),
                    onChanged: (value) {
                      _password = value;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Mật khẩu *',
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
                        labelText: 'Xác nhận mật khẩu *',
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