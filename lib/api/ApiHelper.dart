import 'dart:convert';

import 'package:hellojob/api/dto/LoginResponseDto.dart';
import 'package:hellojob/util/Resource/Resource.dart';
import 'package:http/http.dart' as http;

const BASE_URL = "https://job-portal.hieuhm.com";

Future<LoginResponse> login(String email, String password) async {
  var url = "$BASE_URL/auth/login";
  var httpResponse =  await http.post(url,
      body: jsonEncode(<String, String>{'email': email, 'password': password}));
  return LoginResponse.fromJson(jsonDecode(httpResponse.body));
}