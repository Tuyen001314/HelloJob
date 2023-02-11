import '../../model/Job.dart';

class CreateJobDto {
  String? name;
  String? code;
  String? jobDescription;
  int? salary;
  String? salaryType;
  String? recruitment;
  String? description;
  String? title;
  List<String>? tagIds;
  int? status;
  bool? isHot;
  bool? isCheck;
  String? contractType;
  String? otherArea;
  List<FieldData>? fieldData;
  String? companyId;
  String? expectedRecruitmentDate;
  String? recruitmentDate;
  String? representative;

  CreateJobDto(
      {this.name,
        this.code,
        this.jobDescription,
        this.salary,
        this.salaryType,
        this.recruitment,
        this.description,
        this.title,
        this.tagIds,
        this.status,
        this.isHot,
        this.isCheck,
        this.contractType,
        this.otherArea,
        this.fieldData,
        this.companyId,
        this.expectedRecruitmentDate,
        this.recruitmentDate,
        this.representative});

  CreateJobDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    jobDescription = json['jobDescription'];
    salary = json['salary'];
    salaryType = json['salaryType'];
    recruitment = json['recruitment'];
    description = json['description'];
    title = json['title'];
    tagIds = json['tagIds'].cast<String>();
    status = json['status'];
    isHot = json['isHot'];
    isCheck = json['isCheck'];
    contractType = json['contractType'];
    otherArea = json['otherArea'];
    if (json['fieldData'] != null) {
      fieldData = <FieldData>[];
      json['fieldData'].forEach((v) {
        fieldData!.add(new FieldData.fromJson(v));
      });
    }
    companyId = json['companyId'];
    expectedRecruitmentDate = json['expectedRecruitmentDate'];
    recruitmentDate = json['recruitmentDate'];
    representative = json['representative'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['jobDescription'] = this.jobDescription;
    data['salary'] = this.salary;
    data['salaryType'] = this.salaryType;
    data['recruitment'] = this.recruitment;
    data['description'] = this.description;
    data['title'] = this.title;
    data['tagIds'] = this.tagIds;
    data['status'] = this.status;
    data['isHot'] = this.isHot;
    data['isCheck'] = this.isCheck;
    if (this.fieldData != null) {
      data['fieldData'] = this.fieldData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}