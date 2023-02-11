class UpdateProfileDto {
  String? name;
  String? phone;
  String? dob;
  List<FieldData>? fieldData;

  UpdateProfileDto({this.name, this.phone, this.dob, this.fieldData});

  UpdateProfileDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    dob = json['dob'];
    if (json['fieldData'] != null) {
      fieldData = <FieldData>[];
      json['fieldData'].forEach((v) {
        fieldData!.add(new FieldData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['dob'] = this.dob;
    if (this.fieldData != null) {
      data['fieldData'] = this.fieldData!.map((v) => v.toJson()).toList();
    }
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
