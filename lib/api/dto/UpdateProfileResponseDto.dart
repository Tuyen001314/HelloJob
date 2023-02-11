import '../../model/User.dart';

class UpdateProfileResponseDto {
  String? message;
  User? user;

  UpdateProfileResponseDto({this.message, this.user});

  UpdateProfileResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['newUser'] != null ? new User.fromJson(json['newUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
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