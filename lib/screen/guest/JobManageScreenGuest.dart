import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hellojob/constants.dart';
import 'package:hellojob/screen/DetailJob.dart';
import 'package:hellojob/state/JobState.dart';
import 'package:hellojob/widget/JobItem.dart';
import 'package:provider/provider.dart';

import '../../../model/Job.dart';
import '../../../widget/search_widget.dart';

class JobManageScreenGuest extends StatefulWidget {
  static const String ROUTE_NAME = 'JobManageScreen';

  const JobManageScreenGuest({Key? key}) : super(key: key);

  @override
  State<JobManageScreenGuest> createState() => _JobManageScreenGuestState();
}

class _JobManageScreenGuestState extends State<JobManageScreenGuest> {
  late JobState jobState;
  List<Job> jobs = [];
  late ListJobWidget _listJobWidget;
  late GlobalKey<ListJobWidgetState> _listJobStateKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          const Center(
              child: Text(
            "Trang chủ",
            style: TextStyle(fontFamily: "Inter", fontSize: 32),
          )),
          SearchWidget(
              text: "",
              onChanged: (keyword) => {search(keyword)},
              hintText: "Search job"),
          _listJobWidget,
        ],
      ),
    )));
  }

  @override
  void initState() {
    super.initState();
    jobState = Provider.of<JobState>(context, listen: false);
    _listJobStateKey = GlobalKey<ListJobWidgetState>();
    _listJobWidget = ListJobWidget(key: _listJobStateKey, jobs: jobs);
    getAllJob();
  }

  void getAllJob() {
    jobState.getAllJob(1).then((value) {
      if (value.jobs != null) {
        jobs = value.jobs!;
        _listJobStateKey.currentState!.setState(() {
          _listJobStateKey.currentState?.jobs = jobs;
        });
      }
    });
  }

  void search(String keyword) {
    if(keyword.isNotEmpty) {
      jobState.search(keyword).then((value) {
        if (value.jobs != null) {
          jobs = value.jobs!;
          _listJobStateKey.currentState?.setState(() {
            _listJobStateKey.currentState?.jobs = jobs;
          });
        }
      });
    } else {
      getAllJob();
    }
  }
}

class ListJobWidget extends StatefulWidget {
  List<Job> jobs = [];

  ListJobWidget({required Key key, required this.jobs}) : super(key: key);

  @override
  State<ListJobWidget> createState() => ListJobWidgetState(jobs: jobs);
}

class ListJobWidgetState extends State<ListJobWidget> {
  List<Job> jobs = [];

  ListJobWidgetState({required this.jobs});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, position) {
              return JobItem(job: jobs[position], onPress: () {
                Navigator.of(context).pushNamed("/${DetailJob.ROUTE_NAME}", arguments: jobs[position]);
              });
            },
            separatorBuilder: (context, position) {
              return Divider(
                height: 10,
                color: Color.fromARGB(0, 0, 0, 0),
              );
            },
            shrinkWrap: true,
            itemCount: jobs.length));
  }
}
