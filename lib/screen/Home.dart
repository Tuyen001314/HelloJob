import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellojob/constants.dart';
import 'package:hellojob/screen/ItemView.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Trang chủ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(FluentSystemIcons.ic_fluent_search_regular),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Tìm kiếm việc làm, công ty ...",
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Đã lưu",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print("you are tap");
                          },
                          child: Text("See all",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: colorTenDangNhap,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    SizedBox(child: ItemView()),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: SizedBox(child: ItemView())),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: SizedBox(child: ItemView())),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Đã lưu",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("you are tap");
                    },
                    child: Text("See all",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: colorTenDangNhap,
                        )),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    SizedBox(child: ItemView()),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: SizedBox(child: ItemView())),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: SizedBox(child: ItemView())),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Đã lưu",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("you are tap");
                    },
                    child: Text("See all",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: colorTenDangNhap,
                        )),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    SizedBox(child: ItemView()),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: SizedBox(child: ItemView())),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: SizedBox(child: ItemView())),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
