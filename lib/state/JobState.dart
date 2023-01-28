import 'package:flutter/material.dart';
import 'package:hellojob/model/Job.dart';
import 'package:hellojob/util/Resource/Resource.dart';
import '../api/ApiHelper.dart' as apiHelper;
import '../api/dto/GetAllJobResponse.dart';

class JobState extends ChangeNotifier{
  static JobState? _instance;

  static JobState getInstance() {
    _instance ??= JobState();
    return _instance!;
  }

  Future<GelAllJobResponse> getAllJob(int page) async{
    return apiHelper.getAllJobs(page);
  }
}