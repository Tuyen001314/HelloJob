import 'UserInfo.dart';

class User {
  final UserInfo userInfo;
  final String message;
  final String accessToken;
  final String refreshToken;

  const User({
    required this.userInfo,
    required this.message,
    required this.accessToken,
    required this.refreshToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userInfo: json['id'],
        message: json['message'],
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
      );

  Map<String, dynamic> toJson() => {
        'userInfo': userInfo,
        'message': message,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      };
}
