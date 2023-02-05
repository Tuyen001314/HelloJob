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

    return InkWell(
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.all(8),
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
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/images/job_sample.jpeg"))),
                  ),

                    Text(job.name!,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: CupertinoColors.black,
                        )).applyConstraint(
                    )
        ]
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                child: SizedBox(
                    child: Text(job.description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          color: CupertinoColors.black,
                        )))),
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
                        Text(job.salary!.toString(),
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
        ));
  }
}
