import 'dart:async';
import 'dart:convert';

import 'package:hellojob/api/dto/CreateJobResponseDto.dart';
import 'package:hellojob/api/dto/LoginResponseDto.dart';
import 'package:hellojob/api/dto/RefreshTokenResponseDto.dart';
import 'package:http/http.dart' as http;

import '../model/Job.dart';
import 'dto/CreateJobDto.dart';
import 'dto/GetAllJobResponse.dart';
import 'dto/RegisterErrorDto.dart';
import 'dto/UpdateProfileDto.dart';
import 'dto/UpdateProfileResponseDto.dart';

const BASE_URL = "https://job-portal.hieuhm.com";
var accessToken = "";

Future<LoginResponse> login(String email, String password) async {
  var url = "$BASE_URL/auth/login";
  Map<String, String> headers = {"Content-type": "application/json"};
  var httpResponse = await http.post(url,
      headers: headers,
      body: jsonEncode(<String, String>{"email": email, "password": password}));
  return LoginResponse.fromJson(jsonDecode(httpResponse.body));
}

Future<Object> register(String email, String password) async {
  var url = "$BASE_URL/auth/register";
  Map<String, String> headers = {"Content-type": "application/json"};
  var httpResponse = await http.post(url,
      headers: headers,
      body: jsonEncode(<String, String>{"email": email, "password": password}));
  if (httpResponse.statusCode < 300 && httpResponse.statusCode >= 200) {
    return LoginResponse.fromJson(jsonDecode(httpResponse.body));
  } else {
    return RegisterErrorDto.fromJson(jsonDecode(httpResponse.body));
  }
}

Future<RefreshTokenResponseDto> refreshToken(String refreshToken) async {
  var url = "$BASE_URL/auth/refresh";
  Map<String, String> headers = {"Content-type": "application/json"};
  var httpResponse = await http.post(url,
      headers: headers,
      body: jsonEncode(<String, String>{"refreshToken": refreshToken}));
  return RefreshTokenResponseDto.fromJson(jsonDecode(httpResponse.body));
}

Future<GelAllJobResponse> getAllJobs(int page) async {
  var query = "?page=$page";
  var url = "$BASE_URL/job$query";
  var httpResponse = await http.get(url);
  return GelAllJobResponse.fromJson(jsonDecode(httpResponse.body));
}

Future<GelAllJobResponse> search(String keyword) async {
  var query = "?name=$keyword";
  var url = "$BASE_URL/job$query";
  var httpResponse = await http.get(url);
  return GelAllJobResponse.fromJson(jsonDecode(httpResponse.body));
}

Future<UpdateProfileResponseDto> updateProfile(UpdateProfileDto dto) async {
  var url = "$BASE_URL/user/update-profile";
  print(accessToken);
  Map<String, String> headers = {
    "Content-type": "application/json",
    'Authorization': 'Bearer $accessToken'
  };
  var httpResponse = await http.put(
      url,
    headers: headers,
    body: jsonEncode(dto.toJson()));
  print(httpResponse.body);
  return UpdateProfileResponseDto.fromJson(jsonDecode(httpResponse.body));
}

Future<CreateJobResponseDto> createJob(CreateJobDto dto) async {
  var url = "$BASE_URL/job";
  Map<String, String> headers = {
    "Content-type": "application/json",
    'Authorization': 'Bearer $accessToken'
  };
  var httpResponse = await http.post(
      url,
      headers: headers,
      body: jsonEncode(dto.toJson()));

  return CreateJobResponseDto.fromJson(jsonDecode(httpResponse.body));
}

Future<CreateJobResponseDto> updateJob(CreateJobDto dto, String idJob) async {
  var url = "$BASE_URL/job/${idJob}";
  Map<String, String> headers = {
    "Content-type": "application/json",
    'Authorization': 'Bearer $accessToken'
  };
  var httpResponse = await http.post(
      url,
      headers: headers,
      body: jsonEncode(dto.toJson()));
  return CreateJobResponseDto.fromJson(jsonDecode(httpResponse.body));

}


Future<bool> delete(Job job) async {
  var url = "$BASE_URL/job/${job.id}";
  print(accessToken);
  Map<String, String> headers = {
    "Content-type": "application/json",
    'Authorization': 'Bearer $accessToken'
  };
  var httpResponse = await http.delete(
      url,
      headers: headers);

  return Future(() => httpResponse.statusCode <= 300);
}