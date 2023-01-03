import 'package:hellojob/util/Resource/Resource.dart';

import '../../model/User.dart';

class LoginResponse {
  User? user;
  String? message;
  String? accessToken;
  String? refreshToken;

  LoginResponse({this.user, this.message, this.accessToken, this.refreshToken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message = json['message'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['message'] = this.message;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}