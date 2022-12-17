import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellojob/AppLayout.dart';

import '../constants.dart';

class DetailJob extends StatelessWidget {
  const DetailJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      'Chi tiết công việc',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: AppLayout.getScreenWidth(),
                      height: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: Container(
                        margin: const EdgeInsets.only(),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/mikami.png"))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text("Diễn viên điện ảnh",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: CupertinoColors.black,
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 60),
                          child: Text("120 điểm",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: colorTenDangNhap,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 60, left: 20),
                          child: Text("Kiểm định",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: colorTenDangNhap,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 60, left: 20),
                          child: Text("Hirosima",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: colorTenDangNhap,
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 120),
                          child: Text("Lương cơ bản",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: colorTenDangNhap,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 120, left: 60),
                          child: Text("100 triệu",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 180),
                          child: Text("Lương thực lĩnh",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: colorTenDangNhap,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 180, left: 50),
                          child: Text("100 triệu",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Container(child: TabBarCustom())
            ],
          ),
        ],
      ),
    );
  }
}
