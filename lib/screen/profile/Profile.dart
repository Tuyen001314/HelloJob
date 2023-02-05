import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../state/UserState.dart';
import '../MainScreen.dart';
import '../ItemView.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  late UserState _userState;

  void logout() {
    _userState.logout();
  }

  @override
  Widget build(BuildContext context) {
    _userState = Provider.of<UserState>(context, listen: false);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12.0, bottom: 16),
                      child: Text(
                        'Hồ sơ',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          //no need to provide border radius to make circular image
                          child: Image.asset(
                            "assets/images/gaixinh.jpg",
                            height: 60.0,
                            width: 60.0,
                            fit: BoxFit.cover, //change image fill type
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10, top: 8),
                              child: Text(
                                'Thông tin tài khoản',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 30, top: 6),
                              child: Text(
                                'tendangnhap@gmail.com',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: colorTenDangNhap,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 23, top: 16),
                          child: Text(
                            'Chỉnh sửa',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: Text(
                        'Thông tin chung',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: InkWell(
                        onTap: () {
                          print("you are tap");
                        },
                        child: Text("Xem thêm",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: colorTenDangNhap,
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Họ tên',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorTenDangNhap,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Kana Momonogi',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Số điện thoại',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorTenDangNhap,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        '0123456789',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Quê quán',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorTenDangNhap,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Nhật Bản',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Giới tính',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorTenDangNhap,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Nữ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 24.0, left: 44, right: 44),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(child: Divider()),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Hồ sơ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: () {
                          print("you are tap");
                        },
                        child: Text("Xem thêm",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: colorTenDangNhap,
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        'CMND/CCCD',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorTenDangNhap,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        '---',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Hộ chiếu',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorTenDangNhap,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        '0123456789',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 24.0, left: 44, right: 44),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(child: Divider()),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Liên hệ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: () {
                          print("you are tap");
                        },
                        child: Text("Xem thêm",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: colorTenDangNhap,
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        'Số điện thoại',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorTenDangNhap,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: Text(
                        '0123456789',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorTenDangNhap,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      child: const Text(
                        'tendangnhap@gmail.com',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 24.0, left: 44, right: 44),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Expanded(child: Divider()),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      const SizedBox(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: () {
                          logout();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()),
                          );
                        },
                        child: const Text(
                          'Đăng xuất',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: colorSignOut,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
