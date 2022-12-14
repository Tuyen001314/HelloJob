import 'dart:convert';

import 'package:hellojob/api/dto/LoginResponseDto.dart';
import 'package:hellojob/util/Resource/Resource.dart';
import 'package:http/http.dart' as http;

import 'dto/GetAllJobResponse.dart';

const BASE_URL = "https://job-portal.hieuhm.com";

Future<LoginResponse> login(String email, String password) async {
  var url = "$BASE_URL/auth/login";
  Map<String, String> headers = {"Content-type": "application/json"};
  var httpResponse =  await http.post(url,
      headers: headers,
      body: jsonEncode(<String, String>{"email": email, "password": password}));
  return LoginResponse.fromJson(jsonDecode(httpResponse.body));
}

Future<GelAllJobResponse> getAllJobs() async {
  var url = "$BASE_URL/job";
  var httpResponse =  await http.get(url);
  return GelAllJobResponse.fromJson(jsonDecode(httpResponse.body));
}