
import '../../model/Job.dart';

class CreateJobResponseDto {
  String? name;
  String? code;
  String? jobDescription;
  int? salary;
  String? salaryType;
  String? recruitment;
  String? description;
  String? title;
  List<TagIds>? tagIds;
  int? status;
  bool? isHot;
  bool? isCheck;
  String? contractType;
  String? otherArea;
  List<FieldData>? fieldData;
  CompanyId? companyId;
  String? expectedRecruitmentDate;
  String? recruitmentDate;
  String? representative;

  CreateJobResponseDto({this.name, this.code, this.jobDescription, this.salary, this.salaryType, this.recruitment, this.description, this.title, this.tagIds, this.status, this.isHot, this.isCheck, this.contractType, this.otherArea, this.fieldData, this.companyId, this.expectedRecruitmentDate, this.recruitmentDate, this.representative});

  CreateJobResponseDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    jobDescription = json['jobDescription'];
    salary = json['salary'];
    salaryType = json['salaryType'];
    recruitment = json['recruitment'];
    description = json['description'];
    title = json['title'];
    // if (json['tagIds'] != null) {
    //   tagIds = <TagIds>[];
    //   json['tagIds'].forEach((v) { tagIds!.add(new TagIds.fromJson(v)); });
    // }
    status = json['status'];
    isHot = json['isHot'];
    isCheck = json['isCheck'];
    contractType = json['contractType'];
    otherArea = json['otherArea'];
    if (json['fieldData'] != null) {
      fieldData = <FieldData>[];
      json['fieldData'].forEach((v) { fieldData!.add(new FieldData.fromJson(v)); });
    }
    companyId = json['companyId'] != null ? new CompanyId.fromJson(json['companyId']) : null;
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
    // if (this.tagIds != null) {
    //   data['tagIds'] = this.tagIds!.map((v) => v.toJson()).toList();
    // }
    data['status'] = this.status;
    data['isHot'] = this.isHot;
    data['isCheck'] = this.isCheck;
    data['contractType'] = this.contractType;
    data['otherArea'] = this.otherArea;
    if (this.fieldData != null) {
      data['fieldData'] = this.fieldData!.map((v) => v.toJson()).toList();
    }
    if (this.companyId != null) {
      data['companyId'] = this.companyId!.toJson();
    }
    data['expectedRecruitmentDate'] = this.expectedRecruitmentDate;
    data['recruitmentDate'] = this.recruitmentDate;
    data['representative'] = this.representative;
    return data;
  }
}

class TagIds {
  String? name;
  String? slug;
  TagGroupId? tagGroupId;
  String? parentId;

  TagIds({this.name, this.slug, this.tagGroupId, this.parentId});

  TagIds.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    tagGroupId = json['tagGroupId'] != null ? new TagGroupId.fromJson(json['tagGroupId']) : null;
    parentId = json['parentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.tagGroupId != null) {
      data['tagGroupId'] = this.tagGroupId!.toJson();
    }
    data['parentId'] = this.parentId;
    return data;
  }
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}