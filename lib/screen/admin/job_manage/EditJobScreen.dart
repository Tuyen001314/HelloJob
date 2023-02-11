import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';

import '../../../model/Job.dart';
import '../../../widget/CustomAppBar.dart';

class EditJobScreen extends StatelessWidget {
  static const String ROUTE_NAME = 'EditJobScreen';

  final Job job;

  const EditJobScreen({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ivBack = ConstraintId("iv_back");
    var editFields = getFieldsOfJob(job);
    var editKeys = editFields.keys.toList();
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Sửa công việc",
          onBackPress: () => Navigator.pop(context),
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
                          child: ConstraintLayout(
                            children: [
                              Text(
                                editKeys[position],
                                style: const TextStyle(
                                    color: Color(0x80000000),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11),
                              ).applyConstraint(
                                width: 150,
                                topLeftTo: parent,
                                bottomLeftTo: parent,
                                id: title,
                              ),
                              SizedBox(
                                  child: createValueWidget(context,
                                      editFields[editKeys[position]].toString(),
                                      (newValue) {
                                editFields[editKeys[position]] = newValue;
                              })).applyConstraint(
                                  height: wrapContent,
                                  width: 190,
                                  left: title.right,
                                  centerRightTo: parent)
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, position) {
                        return Divider(height: 1);
                      },
                      itemCount: editKeys.length))
            ],
          ),
        ),
      ),
    ));
  }

  bool isTimeString(String input) {
    try {
      var time = DateTime.parse(input);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  String tryParseTime(String input) {
    try {
      var time = DateTime.parse(input);
      return "${time.day}/${time.month}/${time.year}";
    } on Exception catch (_) {
      return input;
    }
  }

  Map<String, Object> getFieldsOfJob(Job job) {
    var result = <String, Object>{};
    result["Tên"] = job.name!;
    result["Mô tả"] = job.jobDescription!;
    result["Mô tả ngắn"] = job.title!;
    job.fieldData?.forEach((element) {
      result[element.key!] = element.value!;
    });
    return result;
  }

  Widget createValueWidget(
      BuildContext context, String value, Function(String newValue) onChange) {
    if (isTimeString(value)) {
      return InkWell(
        onTap: () {
          showDatePicker(
                  context: context,
                  initialDate: DateTime.parse(value),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030))
              .then((time) => onChange(time!.toIso8601String()));
        },
        child: Text(tryParseTime(value)),
      );
    } else {
      return TextFormField(
        initialValue: value,
        maxLines: null,
        onChanged: (value) {
          onChange(value);
        },
        decoration: InputDecoration(
          border: InputBorder.none
        ),
      );
    }
  }
}
