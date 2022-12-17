import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellojob/AppLayout.dart';
import 'package:hellojob/constants.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      child: Container(
        height: 138,
        width: 328,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/yua.png"))),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12.0, left: 12),
                  child: Row(
                    children: [
                      Text("Diễn viên điện ảnh",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: CupertinoColors.black,
                          )),
                    ],
                  ),
                ),
                Container(
                  height: 23,
                  width: 15,
                  margin: const EdgeInsets.only(left: 123),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/book.png"))),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text(
                      "Đóng các bộ phim tâm lý, tình cảm gia đình, công sở bệnh viện",
                      style: TextStyle(
                        fontSize: 10,
                        color: CupertinoColors.black,
                      )),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colorTenDangNhap,
                  ),
                  height: 22,
                  width: 70,
                  margin: const EdgeInsets.only(top: 8),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("100 triệu",
                          style: TextStyle(
                            fontSize: 10,
                            color: CupertinoColors.black,
                          )),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colorBGDangNhap,
                  ),
                  height: 22,
                  width: 70,
                  margin: const EdgeInsets.only(left: 8, top: 8),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Hiroshima",
                          style: TextStyle(
                            fontSize: 10,
                            color: CupertinoColors.black,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
