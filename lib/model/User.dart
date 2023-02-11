
class User {
  late String email;
  String? name;
  String? phone;
  String? dob;
  late bool disabled;
  late String role;
  late String eligibility;
  String? immigration;
  String? status;
  List<FieldData>? fieldData;
  String? jobId;
  String? companyId;

  User(
      {required this.email,
        this.name,
        this.phone,
        this.dob,
        required this.disabled,
        required this.role,
        required this.eligibility,
        this.immigration,
        this.status,
        this.fieldData,
        this.jobId,
        this.companyId});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    dob = json['dob'];
    disabled = json['disabled'];
    role = json['role'];
    eligibility = json['eligibility'];
    immigration = json['immigration'];
    status = json['status'];
    if (json['fieldData'] != null) {
      fieldData = <FieldData>[];
      json['fieldData'].forEach((v) {
        fieldData!.add(new FieldData.fromJson(v));
      });
    }
    jobId = json['jobId'];
    companyId = json['companyId'];
  }
  
  bool isAdmin() {
    return email.contains('admin');
  }

  String? getAddress() {
    String? address;
    for (var element in fieldData!) {

      if(element.key == "CURRENT_ADDRESS") {
        if(element.value != null) {
          address = element.value!;
          break;
        }
      }
    };
    return address;
  }


  String? getGender() {
    var gender = null;
    for (var element in fieldData!) {
      if(element.key == "GENDER") {
        if(element.value != null) {
          gender = element.value!;
          break;
        }
      }
    }
    return gender;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['dob'] = this.dob;
    data['disabled'] = this.disabled;
    data['role'] = this.role;
    data['eligibility'] = this.eligibility;
    data['immigration'] = this.immigration;
    data['status'] = this.status;
    if (this.fieldData != null) {
      data['fieldData'] = this.fieldData!.map((v) => v.toJson()).toList();
    }
    data['jobId'] = this.jobId;
    data['companyId'] = this.companyId;
    return data;
  }
}

class FieldData {
  String? value;
  String? key;
  String? type;
  String? group;

  FieldData({this.value, this.key, this.type, this.group});

  FieldData.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    key = json['key'];
    type = json['type'];
    group = json['group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['key'] = this.key;
    data['type'] = this.type;
    data['group'] = this.group;
    return data;
  }
}