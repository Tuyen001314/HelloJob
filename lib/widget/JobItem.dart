import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:hellojob/model/Job.dart';

import '../constants.dart';

class JobItem extends StatelessWidget {
  final Job job;
  final VoidCallback onPress;

  const JobItem({required this.job, required this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    var jobPreviewId = ConstraintId("job_preview");
    var jobDescriptionId = ConstraintId("description");

    return InkWell(
        onTap: onPress,
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ConstraintLayout(
                height: 108,
                children: [
              Container(
                margin: const EdgeInsets.only(),
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/job_sample.jpeg"))),
              ).applyConstraint(id: jobPreviewId, topLeftTo: parent),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/ic_brand.png",
                        width: 22,
                        height: 10,
                      ),
                      Container(width: 3),
                      Text(
                        "Kiểm định",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Colors.black54),
                      )
                    ],
                  ),
                  Divider(
                    height: 8,
                    color: Colors.transparent,
                  ),
                  Text(job.name!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: CupertinoColors.black,
                      ))
                ],
              ).applyConstraint(
                  left: jobPreviewId.right,
                  top: jobPreviewId.top,
                  margin: EdgeInsets.only(left: 8)),
              Text(job.description!,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 10,
                        color: CupertinoColors.black,
                      ))
                  .applyConstraint(
                      id: jobDescriptionId,
                      top: jobPreviewId.bottom,
                      centerHorizontalTo: parent,
                      width: matchConstraint,
                      height: 10,
                      margin: EdgeInsets.only(top: 8, right: 8)),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: colorTenDangNhap,
                    ),
                    height: 22,
                    margin: const EdgeInsets.only(top: 8),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child:
                        Text(job.salary!.toString(),
                            style: TextStyle(
                              fontSize: 10,
                              color: CupertinoColors.black,
                            )
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: colorBGDangNhap,
                    ),
                    height: 22,
                    margin: const EdgeInsets.only(left: 8, top: 8),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child:
                        Text(job.getAddress() ?? "Unknown Address",
                            style: TextStyle(
                              fontSize: 10,
                              color: CupertinoColors.black,
                            ),
                    ),
                  ),
                ],
              ).applyConstraint(
                  top: jobDescriptionId.bottom,
                  left: jobDescriptionId.left)
            ])));
  }
}
