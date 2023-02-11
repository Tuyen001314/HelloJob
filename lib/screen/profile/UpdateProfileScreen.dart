import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:hellojob/widget/CustomAppBar.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../model/User.dart';
import '../../state/UserState.dart';
import '../../util/ToastExt.dart';
import '../../widget/PickText.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'UpdateProfileScreen';

  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late Map<String, String?> map;
  late List<String> params;
  List<String?> texts = [];

  late User _user;
  late UserState _userState;

  @override
  void initState() {
    super.initState();
    _userState = Provider.of<UserState>(context, listen: false);
    _user = _userState.currentUser.data!;

    map = getListJobParams();
    params = map.keys.toList();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
              title: "Sửa hồ sơ",
              onBackPress: () {
                Navigator.of(context).pop();
              },
            ),
            body: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
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
                        if (!validAllField()) {
                          toast("Bạn phải điền hết các thông tin");
                        } else {
                          updateProfile();
                        }
                      }, onCancel: () {
                        Navigator.of(context).pop();
                      }),
                    )
                  ],
                ))));
  }

  Map<String, String?> getListJobParams() {
    print("create");
    return {
      "Họ tên": _user.name,
      "Số điện thoại": _user.phone,
      "Quê quán": _user.getAddress(),
      "Giới tính": _user.getGender(),
      "Ngày sinh": parseTime(toTime(_user.dob))
    };
  }

  String parseTime(DateTime? time) {
    if (time != null) {
      return "${time.day}/${time.month}/${time.year}";
    } else {
      return "Nhấn để nhập";
    }
  }

  DateTime? toTime(String? time) {
    try {
      var splits = time?.split("/").map((e) => int.parse(e)).toList();
      if (splits != null) {
        return DateTime(splits[2], splits[1], splits[0]);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  Widget createValueWidget(BuildContext context, String param) {
    var isTimeParam = param.contains("Ngày");
    if (isTimeParam) {
      return PickTimeView(toTime(map[param]), (date) {
        print("onchange $param ${map}");
        map[param] = parseTime(date);
      });
    } else {
      return TextFormField(
          initialValue: map[param],
          maxLines: null,
          onChanged: (value) {
            map[param] = value;
            print("onchange $param ${map}");

          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Nhấn để nhập",
          ));
    }
  }

  bool validAllField() {
    var isValid = true;
    for (var element in params) {
      print(element + " ${map[element]}");
      if (element == null || element.isEmpty == true || element == "Nhấn để nhập") {
        isValid = false;
        break;
      }
    }
    return isValid;
  }

  void updateProfile() {
    _userState.updateProfile(
        map["Họ tên"], map["Số điện thoại"], toTime(map["Ngày sinh"])).then((success) {
          if(success) {
            // Navigator.of(context).popUntil((route) => route.)
          } else {
            toast("Đã có lỗi xảy ra");
          }
    });
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
      height: 44,
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
