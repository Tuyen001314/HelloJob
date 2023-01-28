import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellojob/screen/admin/job_manage/JobManageScreen.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Trang chủ",
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Inter',
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: Container(
                      margin: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all()
                      ),

                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 46, bottom: 46),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/ic_store.svg"),
                              const Text("Quản lý job")
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed("/${JobManageScreen.ROUTE_NAME}");
                        },
                      )),
                ),
                Flexible(child: Container(
                    margin: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all()
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 46, bottom: 46),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/ic_store.svg"),
                          const Text("Quản lý user")
                        ],
                      ),
                    ))),


              ],
            ),
          )
        ],
      ),
    );
  }
}
