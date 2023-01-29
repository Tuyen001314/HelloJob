import 'dart:convert';

import 'package:hellojob/api/dto/LoginResponseDto.dart';
import 'package:hellojob/api/dto/RefreshTokenResponseDto.dart';
import 'package:http/http.dart' as http;

import 'dto/GetAllJobResponse.dart';
import 'dto/RegisterErrorDto.dart';

const BASE_URL = "https://job-portal.hieuhm.com";

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


// Future<GelAllJobResponse> getAllJobs() async {
//   var url = "$BASE_URL/job";
//   var httpResponse = await http.get(url);
//   return GelAllJobResponse.fromJson(jsonDecode(httpResponse.body));
// }

Future<GelAllJobResponse> getAllJobs(int page) async {
  var query = "?page=$page";
  var url = "$BASE_URL/job$query";
  var httpResponse = await http.get(url);
  return GelAllJobResponse.fromJson(jsonDecode(httpResponse.body));
}
