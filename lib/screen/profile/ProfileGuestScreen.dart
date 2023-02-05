import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
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
    var btSignIn = ConstraintId("sign_in");
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ConstraintLayout(
          children: [
            const Text(
              "Hồ sơ",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  fontSize: 24),
            ).applyConstraint(topCenterTo: parent),
            Text(
              "Không có thông tin",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: onSurfaceColor),
            ).applyConstraint(centerTo: parent),

            ElevatedButton(
              onPressed: toSignInScreen,
              child: Text(
                "Đăng nhập",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: colorDangKy),
            ).applyConstraint(
                id: btSignIn,
                width: matchConstraint,
                margin: EdgeInsets.symmetric(horizontal: 16),
                topCenterTo: parent,
                centerHorizontalTo: parent,
                bottomCenterTo: parent,
                verticalBias: 0.78),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Chưa có tài khoản?",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: onSurfaceColor),
                ),
                Container(
                  height: 1,
                  width: 8,
                ),
                InkWell(
                  onTap: toSignUpScreen,
                  child: Text(
                    "Đăng ký",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: colorDangKy),
                  ),
                )
              ],
            ).applyConstraint(
                top: btSignIn.bottom,
                margin: EdgeInsets.only(top: 12),
                centerHorizontalTo: parent)
          ],
        ),
      ),
    ));
  }
}
