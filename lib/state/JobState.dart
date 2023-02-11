import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellojob/model/Job.dart';

import '../api/ApiHelper.dart' as apiHelper;
import '../api/dto/GetAllJobResponse.dart';
import '../util/SharePrefUtil.dart';

class JobState extends ChangeNotifier {
  static JobState? _instance;

  static JobState getInstance() {
    _instance ??= JobState();
    return _instance!;
  }

  Future<GelAllJobResponse> getAllJob(int page) async {
    return apiHelper.getAllJobs(page);
  }

  Future<GelAllJobResponse> search(String keyword) async {
    return apiHelper.search(keyword);
  }

  List<Job> getSavedJob() {
    return SharePrefUtil.getInstance().saveJobs;
  }

  addSaveJob(Job job) {
    var jobs = getSavedJob();
    var existJob = jobs.firstWhereOrNull((element) => job.name == element.name);
    if(existJob != null) {
      return false;
    } else {
      jobs.add(job);
      SharePrefUtil.getInstance().setSaveJob(jobs);
      notifyListeners();
      return true;
    }
  }
}
