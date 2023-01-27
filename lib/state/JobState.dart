import 'package:flutter/material.dart';
import 'package:hellojob/model/Job.dart';
import 'package:hellojob/util/Resource/Resource.dart';
import '../api/ApiHelper.dart' as apiHelper;

class JobState extends ChangeNotifier{
  static JobState? _instance;

  static JobState getInstance() {
    _instance ??= JobState();
    return _instance!;
  }

  Future<void> getAllJob(int page) async{
    // await apiHelper.getAllJobs(page).then((value) => value.jobs)
  }
}