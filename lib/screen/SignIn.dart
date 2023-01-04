import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hellojob/api/ApiHelper.dart';
import 'package:hellojob/constants.dart';
import 'package:hellojob/screen/SignUp.dart';

class SignIn extends StatelessWidget {
  String email = "";
  var password = "";
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
                    child: Image.asset('assets/images/Group1.png'),
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
                      email = value;
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
                    onChanged: (value) {
                      password = value;
                    },
                    style: TextStyle(
                      fontSize: 15,
                      color: colorTenDangNhap,
                    ),
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
                    onPressed:() {click(email, password);},
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
                      Text("Đăng ký", style: TextStyle(color: colorDangKy)),
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

void click(email, password) {
  var response = getAllJobs();
  print(email + password);
  response.whenComplete(() => print("login complete"))
  .then((value) => value.jobs?.forEach((job) {
    print(job.code);
  }));
}
