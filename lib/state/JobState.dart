import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hellojob/api/dto/CreateJobDto.dart';
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

  Future<void> addJob(String name, String jobDescription, String description, int salary,
      {List<FieldData>? fieldDatas}) async {
    var dto = CreateJobDto(
      name: name,
      jobDescription: jobDescription,
      code: DateTime.now().microsecondsSinceEpoch.toString(),
      description: description,
      salary: salary,
      recruitment: "tesst",
      salaryType: "MONTH",
      tagIds: ["633c5ed1ff8cbc093e7289ef"],
      status: 1,
      title: "njbk",
      fieldData: [
        FieldData.fromJson({
          "key" : "Nơi làm việc",
          "value": "Tokyo"
        })
      ],
      isHot: false,
      isCheck: false
    );
    await apiHelper.createJob(dto).then((value) {
      print(value);
    });
  }
  Future<bool> delete(Job job) async {
    return apiHelper.delete(job);
  }
}


