import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:hellojob/util/ToastExt.dart';
import 'package:hellojob/widget/CustomAppBar.dart';
import 'package:provider/provider.dart';

import '../../AppLayout.dart';
import '../../constants.dart';
import '../../model/Job.dart';
import '../../state/JobState.dart';
import '../../state/UserState.dart';

class DetailJob extends StatelessWidget {
  static const String ROUTE_NAME = 'DetailJob';
  final Job job;
  late UserState _userState;
  late JobState _jobState;

  DetailJob({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _userState = Provider.of<UserState>(context, listen: false);
    _jobState = Provider.of<JobState>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Chi tiết công việc",
          onBackPress: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: backgroundColor,
        body: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
              _BottomLayout(
                  isAdmin: _userState.currentUser.data?.isAdmin() == true,
                  onPrimaryClick: (isAdmin) {
                    if (!isAdmin) {
                      toast("Coming soon");
                    }
                  },
                  onSecondaryClick: (isAdmin) {
                    if (isAdmin) {
                      Navigator.pop(context);
                    } else {
                      _jobState.addSaveJob(job);
                      toast("Công việc đã được lưu thành công");
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomLayout extends StatelessWidget {
  final bool isAdmin;
  final Function(bool) onPrimaryClick;
  final Function(bool) onSecondaryClick;

  const _BottomLayout(
      {Key? key,
      required this.isAdmin,
      required this.onPrimaryClick,
      required this.onSecondaryClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var guideline = ConstraintId("guideline");
    return ConstraintLayout(
      height: 60,
      children: [
        if (!isAdmin) ...[
          Guideline(id: guideline, guidelinePercent: 0.7),
          Padding(
                  padding: const EdgeInsets.only(
                      left: 8, top: 8, right: 4, bottom: 4),
                  child: ElevatedButton(
                    onPressed: () => onPrimaryClick(isAdmin),
                    style: ElevatedButton.styleFrom(
                      primary: primary80,
                    ),
                    child: const Text("Tư vấn liên hệ",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: colorText)),
                  ))
              .applyConstraint(
                  width: matchConstraint,
                  topLeftTo: parent,
                  right: guideline.left),
          Padding(
            padding:
                const EdgeInsets.only(left: 4, top: 8, right: 8, bottom: 4),
            child: ElevatedButton(
                onPressed: () => onSecondaryClick(isAdmin),
                style: ElevatedButton.styleFrom(
                  primary: surfaceVariant,
                ),
                child: const Text("Lưu",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: neturalVariant))),
          ).applyConstraint(
              width: matchConstraint, topRightTo: parent, left: guideline.right)
        ] else ...[
          Guideline(id: guideline, guidelinePercent: 0.5),
          Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () => onPrimaryClick(isAdmin),
                    style: ElevatedButton.styleFrom(
                      primary: surfaceVariant,
                    ),
                    child: const Text("Xóa",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: errorColor)),
                  ))
              .applyConstraint(
                  width: matchConstraint,
                  topLeftTo: parent,
                  right: guideline.left),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
                onPressed: () => onSecondaryClick(isAdmin),
                style: ElevatedButton.styleFrom(
                  primary: surfaceVariant,
                ),
                child: const Text("Sửa",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: neturalVariant))),
          ).applyConstraint(
              width: matchConstraint, topRightTo: parent, left: guideline.right)
        ]
      ],
    );
  }
}
