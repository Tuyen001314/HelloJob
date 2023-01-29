import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellojob/constants.dart';
import 'package:hellojob/state/JobState.dart';
import 'package:hellojob/widget/JobItem.dart';
import 'package:provider/provider.dart';

import '../../../model/Job.dart';
import '../../../widget/search_widget.dart';

class JobManageScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'JobManageScreen';

  const JobManageScreen({Key? key}) : super(key: key);

  @override
  State<JobManageScreen> createState() => _JobManageScreenState();
}

class _JobManageScreenState extends State<JobManageScreen> {
  @override
  Widget build(BuildContext context) {
    var jobState = Provider.of<JobState>(context, listen: false);
    return Scaffold(

      // backgroundColor: background,
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Center(
              child: Text(
            "Quản lý job",
            style: TextStyle(fontFamily: "Inter", fontSize: 32),
          )),
          SearchWidget(text: "", onChanged: (_) => {}, hintText: "Search job"),
          ListJobWidget(jobState: jobState)
        ],
      ),
    )));
  }
}

class ListJobWidget extends StatefulWidget {
  final JobState jobState;

  const ListJobWidget({Key? key, required this.jobState}) : super(key: key);

  @override
  State<ListJobWidget> createState() => _ListJobWidgetState(jobState: jobState);
}

class _ListJobWidgetState extends State<ListJobWidget> {
  final JobState jobState;
  List<Job> jobs = [];

  _ListJobWidgetState({required this.jobState});

  @override
  void initState() {
    super.initState();
    jobState.getAllJob(1).then((value) => setState(() {
          if (value.jobs != null) {
            jobs = value.jobs!;
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.separated(
        itemBuilder: (context, position) {
          return JobItem(job: jobs[position], onPress: () {});
        },
        separatorBuilder: (context, position) {
          return Divider(height: 10, color: Color.fromARGB(0, 0, 0, 0),);
        },
        shrinkWrap: true,
        itemCount: jobs.length));
  }
}
