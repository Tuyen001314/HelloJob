import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';

import '../AppLayout.dart';
import '../constants.dart';
import '../model/Job.dart';

class DetailJob extends StatelessWidget {
  static const String ROUTE_NAME = 'DetailJob';
  final Job job;

  const DetailJob({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12.0, bottom: 12),
                  child: Text(
                    'Chi tiết công việc',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Stack(
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
                                image: AssetImage(
                                    "assets/images/job_sample.jpeg"))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(job.name!,
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
                          child: Text(job.salary.toString(),
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
                          child: Text(job.salary.toString(),
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
              ],
            ),
            Expanded(
                child: ListView.separated(
              primary: false,
              itemBuilder: (context, position) {
                var title = ConstraintId("title");
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConstraintLayout(
                    size: wrapContent,
                    children: [
                      Text(
                        job.fieldData![position].key!,
                        style: const TextStyle(
                            color: Color(0x80000000),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 11),
                      ).applyConstraint(
                        width: 150,
                        topLeftTo: parent,
                        id: title,
                      ),
                      SizedBox(
                        child: Text(
                          job.fieldData![position].value.toString(),
                        ),
                      ).applyConstraint(
                          height: wrapContent,
                          width: 190,
                          left: title.right,
                          centerRightTo: parent)
                    ],
                  ),
                );
              },
              separatorBuilder: (context, position) {
                return Center(child: Divider(height: 1, color: dividerColor));
              },
              itemCount: job.fieldData?.length ?? 0,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
            )),
            _BottomLayout(onDelete: () {}, onEdit: () {})
          ],
        ),
      ),
    );
  }
}

class _BottomLayout extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const _BottomLayout({Key? key, required this.onDelete, required this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var guideline = ConstraintId("guideline");
    return ConstraintLayout(
      height: 44,
      children: [
        Guideline(id: guideline, guidelinePercent: 0.5),
        Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                    onPressed: onDelete,
                    child: const Text("Xoá",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: errorColor))))
            .applyConstraint(
                width: matchConstraint,
                topLeftTo: parent,
                right: guideline.left),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ElevatedButton(
              onPressed: onDelete,
              child: const Text("Sửa",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: errorColor))),
        ).applyConstraint(
            width: matchConstraint, topRightTo: parent, left: guideline.right)
      ],
    );
  }
}
