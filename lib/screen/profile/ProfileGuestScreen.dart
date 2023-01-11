import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellojob/screen/auth/SignIn.dart';

import '../../constants.dart';
import '../auth/SignUp.dart';

class ProfileGuestScreen extends StatefulWidget {
  const ProfileGuestScreen({Key? key}) : super(key: key);

  @override
  State<ProfileGuestScreen> createState() => _ProfileGuestScreenState();
}

class _ProfileGuestScreenState extends State<ProfileGuestScreen> {
  void toSignInScreen() {
    Navigator.of(context).pushNamed("/${SignIn.ROUTE_NAME}");
  }

  void toSignUpScreen() {
    Navigator.of(context).pushNamed("/${SignUp.ROUTE_NAME}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ho so"),
      ),
      body: Column(
        children: [
          const Center(child: Text("Khong co thong tin",)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: colorBGDangNhap),
              onPressed: toSignInScreen,
              child: Center(child: Text("Dang nhap"),)),
          Center(
            child: Row(
              children: [
                const Text("Chua co tai khoan?"),
                InkWell(onTap: toSignUpScreen,child: const Text("Dang ki ngay"),)
    ]
            )
          )
        ],
      ),
    );
  }
}
