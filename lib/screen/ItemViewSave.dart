import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellojob/constants.dart';
import 'package:hellojob/screen/ItemDetail.dart';

class ItemViewSave extends StatelessWidget {
  const ItemViewSave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16.0, bottom: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Công việc đã lưu",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    // Container(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       Container(
                    //         height: 18,
                    //         width: 18,
                    //         margin: const EdgeInsets.only(left: 15),
                    //         decoration: BoxDecoration(
                    //             image: const DecorationImage(
                    //                 fit: BoxFit.cover,
                    //                 image:
                    //                     AssetImage("assets/images/book.png"))),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
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
              margin: const EdgeInsets.only(top: 16.0, left: 6, right: 16),
              child: Row(
                children: [
                  SizedBox(child: ItemDetail()),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
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
              margin: const EdgeInsets.only(top: 16.0, left: 6, right: 16),
              child: Row(
                children: [
                  SizedBox(child: ItemDetail()),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
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
              margin: const EdgeInsets.only(top: 16.0, left: 6, right: 16),
              child: Row(
                children: [
                  SizedBox(child: ItemDetail()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
