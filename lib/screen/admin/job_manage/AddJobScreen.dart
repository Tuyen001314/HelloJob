import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:hellojob/widget/CustomAppBar.dart';

import '../../../widget/PickText.dart';

class AddJobScreen extends StatelessWidget {
  static const String ROUTE_NAME = 'AddJobScreen';

  AddJobScreen({Key? key}) : super(key: key);

  late Map<String, String> map;
  late List<String> params;

  @override
  Widget build(BuildContext context) {
    map = getListJobParams();
    params = getListJobParams().keys.toList();
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            title: "Thêm công việc",
            onBackPress: () {
              Navigator.of(context).pop(null);
            },
          ),
          body: Padding(
            padding: EdgeInsets.zero,
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
                  itemCount: params.length),
            ),
          ),
    );
  }

  Map<String, String> getListJobParams() {
    return {
      "Tên": "Nhấn để nhập",
      "Mô tả": "Nhấn để nhập",
      "Mô tả ngắn gọn": "Nhấn để nhập",
      "Lương tháng": "Nhấn để nhập",
      "Ngày dự tuyển": "Nhấn để nhập",
      'Ngày tuyển': "Nhấn để nhập",
      "Người đại diện": "Nhấn để nhập",
      "Địa chỉ": "Nhấn để nhập",
      "Nơi làm việc": "Nhấn để nhập",
      "Ngành nghề": "Nhấn để nhập",
      "Thời hạn nộp hồ sơ": "Nhấn để nhập",
      "Số lượng": "Nhấn để nhập",
      "Tuổi": "Nhấn để nhập",
      "Học vấn": "Nhấn để nhập",
      "Các yêu cầu khác": "Nhấn để nhập",
      "Ghi chú": "Nhấn để nhập"
    };
  }

  String parseTime(DateTime time) {
    return "${time.day}/${time.month}/${time.year}";
  }

  Widget createValueWidget(BuildContext context, String param) {
    var isTimeParam = param.contains("Ngay");
    if (isTimeParam) {
      return PickTimeView(DateTime.now(), (date) {
        map[param] = parseTime(date);
      });
    } else {
      return TextFormField(
        maxLines: null,
        onChanged: (value) {
          map[param] = value;
        },
        decoration: InputDecoration(border: InputBorder.none,
        hintText: map[param]),
      );
    }
  }
}
