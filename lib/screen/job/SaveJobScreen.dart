import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:hellojob/constants.dart';
import 'package:hellojob/widget/CustomAppBar.dart';
import 'package:provider/provider.dart';

import '../../model/Job.dart';
import '../../state/JobState.dart';
import '../../widget/JobItem.dart';
import '../ItemSave.dart';
import '../auth/DetailJobAuth.dart';

class SaveJobScreen extends StatefulWidget {
  const SaveJobScreen({Key? key}) : super(key: key);

  @override
  State<SaveJobScreen> createState() => _SaveJobScreenState();
}

class _SaveJobScreenState extends State<SaveJobScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Công việc đã lưu",
        ),
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_ListJobWidget()]
          ),
        )



      ),
    );
  }
}

class _ListJobWidget extends StatefulWidget {
  List<Job> jobs = [];

  _ListJobWidget();

  @override
  State<_ListJobWidget> createState() => _ListJobWidgetState(jobs: jobs);
}

class _ListJobWidgetState extends State<_ListJobWidget> {
  late JobState jobState;
  List<Job> jobs = [];


  @override
  void initState() {
    super.initState();
    jobState = Provider.of<JobState>(context, listen: false);
  }

  _ListJobWidgetState({required this.jobs});

  @override
  Widget build(BuildContext context) {
    getSavedJobs();
    if(jobs.isEmpty) {
         return Center(child: Text("No data"));
      } else {
        return Expanded(
            child: ListView.separated(
                itemBuilder: (context, position) {
                  return JobItem(
                      job: jobs[position],
                      onPress: () {
                        Navigator.of(context).pushNamed(
                            "/${DetailJob.ROUTE_NAME}",
                            arguments: jobs[position]);
                      });
                },
                separatorBuilder: (context, position) {
                  return const Divider(
                    height: 10,
                    color: Color.fromARGB(0, 0, 0, 0),
                  );
                },
                shrinkWrap: true,
                itemCount: jobs.length));
      }
  }

  void getSavedJobs() {
    jobs = jobState.getSavedJob();
  }
}

