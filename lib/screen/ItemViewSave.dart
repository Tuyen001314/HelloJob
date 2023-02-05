import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellojob/constants.dart';

import 'ItemSave.dart';

class ItemViewSave extends StatelessWidget {
  const ItemViewSave({Key? key}) : super(key: key);

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
                          "Công việc đã lưu",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
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
                            fontSize: 16,
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
                                fontSize: 12,
                                color: colorTenDangNhap,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    SizedBox(child: ItemSave()),
                  ],
                ),
              ),
            ),
            Container(
              child: Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    SizedBox(child: ItemSave()),
                  ],
                ),
              ),
            ),
            // Container(
            //   child: Container(
            //     margin: const EdgeInsets.only(top: 16.0),
            //     child: Column(
            //       children: [
            //         SizedBox(child: ItemSave()),
            //         SizedBox(child: ItemSave()),
            //         SizedBox(child: ItemSave()),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
