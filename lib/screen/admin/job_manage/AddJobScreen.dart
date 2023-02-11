import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:hellojob/util/ToastExt.dart';
import 'package:hellojob/widget/CustomAppBar.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../state/JobState.dart';
import '../../../widget/PickText.dart';

class AddJobScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'AddJobScreen';

  AddJobScreen() {

  }


  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  late JobState _jobState;
  late List<String> params;
  late Map<String, String?> map;

  @override
  void initState() {
    super.initState();
    map = getListJobParams();
    params = map.keys.toList();
    _jobState = Provider.of<JobState>(context, listen: false);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            title: "Thêm công việc",
            onBackPress: () {
              Navigator.of(context).pop();
            },
          ),
          body: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, position) {
                        var title = ConstraintId("title");
                        return Padding(
                            padding: EdgeInsets.all(8),
                            child: ConstraintLayout(children: [
                              Text(
                                params[position]!,
                                style: const TextStyle(
                                    color: Color(0x80000000),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ).applyConstraint(
                                width: 125,
                                topLeftTo: parent,
                                bottomLeftTo: parent,
                                id: title,
                              ),
                              SizedBox(
                                      child: createValueWidget(
                                          context, params[position]))
                                  .applyConstraint(
                                      height: wrapContent,
                                      width: 190,
                                      left: title.right,
                                      centerRightTo: parent)
                            ]));
                      },
                      separatorBuilder: (context, positision) {
                        return Divider(height: 1);
                      },
                      itemCount: params.length)),
              Container(
                margin: EdgeInsets.all(8),
                child: _BottomLayout(onSave: () {
                  try {
                    if (validAllField()) {
                      _jobState.addJob(map["Tên"]!, map["Mô tả"]!,
                          map["Mô tả ngắn gọn"]!, int.parse(map["Lương tháng"]!));
                    } else {
                      toast("Bạn phải điền hết các thông tin");
                    }
                  } on FormatException catch(e) {
                    toast(e.message);
                  }


                }, onCancel: () {
                  Navigator.of(context).pop();
                }),
              )
            ],
          )),
    );
  }

  Map<String, String?> getListJobParams() {
    print("getfds");
    return {
      "Tên": null,
      "Mô tả": null,
      "Mô tả ngắn gọn": null,
      "Lương tháng": null,
    };
  }

  String? parseTime(DateTime? time) {
    if (time != null) {
      return "${time.day}/${time.month}/${time.year}";
    } else {
      return "Nhấn để nhập";
    }
  }

  Widget createValueWidget(BuildContext context, String param) {
    var isTimeParam = param.contains("Ngày");
    if (isTimeParam) {
      return PickTimeView(DateTime.now(), (date) {
        map[param] = parseTime(date);
      });
    } else {
      return TextFormField(
        maxLines: null,
        onChanged: (value) {
          map[param] = value;
          print("${param}   ${map[param]}  $value");
        },
        decoration:
            InputDecoration(border: InputBorder.none, hintText: "Nhấn để nhập"),
      );
    }
  }

  bool validAllField() {
    var isValid = true;
    for (var element in map.values.toList()) {
      if (element == null ||
          element.isEmpty == true ||
          element == "Nhấn để nhập") {
        isValid = false;
        break;
      }
    }
    print(map);
    if (int.tryParse(map["Lương tháng"] ?? "") == null) {
      throw FormatException("Lương tháng phải là 1 số");
    }
    return isValid;
  }
}

class _BottomLayout extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const _BottomLayout({Key? key, required this.onSave, required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var guideline = ConstraintId("guideline");
    return ConstraintLayout(
      height: 60,
      children: [
        Guideline(id: guideline, guidelinePercent: 0.5),
        Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: onSave,
                  style: ElevatedButton.styleFrom(
                    primary: surfaceVariant,
                  ),
                  child: const Text("Lưu",
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
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ElevatedButton(
              onPressed: onCancel,
              style: ElevatedButton.styleFrom(
                primary: surfaceVariant,
              ),
              child: const Text("Huỷ",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: neturalVariant))),
        ).applyConstraint(
            width: matchConstraint, topRightTo: parent, left: guideline.right)
      ],
    );
  }
}
