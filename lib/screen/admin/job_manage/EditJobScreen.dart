import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:flutter_svg/svg.dart';

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
    return SafeArea(child: Scaffold(
      appBar: CustomAppBar(
        title:"Sửa công việc",
        onBackPress: () => Navigator.pop(context),
      ),
      body:  Padding(
        padding: EdgeInsets.all(8),
        child: ConstraintLayout(
          children: [

            // Expanded(child: ListView.separated(
            //     itemBuilder: (context, position) {
            //       var title = ConstraintId("title");
            //       return Padding(
            //         padding: EdgeInsets.all(8),
            //         child: ConstraintLayout(
            //           children: [
            //             Text(
            //               editKeys[position],
            //               style: const TextStyle(
            //                   color: Color(0x80000000),
            //                   fontFamily: 'Inter',
            //                   fontWeight: FontWeight.w500,
            //                   fontSize: 11),
            //             ).applyConstraint(
            //               width: 150,
            //               topLeftTo: parent,
            //               id: title,
            //             ),
            //             SizedBox(
            //               child: Text(
            //                 editFields[editKeys[position]].toString(),
            //               ),
            //             ).applyConstraint(
            //                 height: wrapContent,
            //                 width: 190,
            //                 left: title.right,
            //                 centerRightTo: parent)
            //           ],
            //         ),
            //       );
            //     },
            //     separatorBuilder: separatorBuilder,
            //     itemCount: itemCount))

          ],
        ),
      ),
    ));


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
}


