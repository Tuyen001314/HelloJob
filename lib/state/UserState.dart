import 'package:flutter/foundation.dart';
import 'package:hellojob/api/dto/LoginResponseDto.dart';
import 'package:hellojob/api/dto/RegisterErrorDto.dart';
import 'package:hellojob/util/Resource/Resource.dart';
import 'package:hellojob/util/SharePrefUtil.dart';

import '../api/ApiHelper.dart' as apiHelper;
import '../api/dto/UpdateProfileDto.dart';
import '../model/User.dart';

class UserState extends ChangeNotifier {
  static UserState? _instance;

  static UserState getInstance() {
    _instance ??= UserState();
    return _instance!;
  }

  String _accessToken = '';

  String get accessToken => _accessToken;

  set accessToken(String value) {
    _accessToken = value;
  }

  Resource<User> currentUser = Resource.failure("No user");

  Future<void> getUserFromLocal() async {
    var saveUserName = SharePrefUtil.getInstance().saveUserName;
    var savePassword = SharePrefUtil.getInstance().savePassword;
    if (saveUserName?.isNotEmpty == true && savePassword?.isNotEmpty == true) {
      await apiHelper.login(saveUserName!, savePassword!).then((value) {
        if (value.user != null) {
          _accessToken = value.accessToken!;
          currentUser = Resource.success(data: value.user!);
        } else {
          currentUser = Resource.failure(value.message!);
        }
        notifyListeners();
      });
    } else {
      currentUser = Resource.failure("");
      notifyListeners();
    }
  }

  Future<void> login(String userName, String password) async {
    await apiHelper.login(userName, password).then((value) {
      print(value.message);
      if (value.user != null) {
        _accessToken = value.accessToken!;
        currentUser = Resource.success(data: value.user!);
        SharePrefUtil.getInstance().setSaveUserName(userName);
        SharePrefUtil.getInstance().setSavePassword(password);
      } else {
        currentUser = Resource.failure(value.message!);
      }
      notifyListeners();
    });
  }

  Future<void> logout() async {
    currentUser = Resource.failure("No user");
    SharePrefUtil.getInstance().setSaveUserName('');
    SharePrefUtil.getInstance().setSavePassword('');
  }

  Future<void> register(String userName, String password) async {
    if (userName.isEmpty) {
      currentUser = Resource.failure("Ten dang nhap trong");
    } else if (password.isEmpty) {
      currentUser = Resource.failure("Mat khau trong");
    } else if (password.length < 8) {
      currentUser = Resource.failure("Mat khau phai co it nhat 8 ki tu");
    } else {
      await apiHelper.register(userName, password).then((value) {
        if (value is LoginResponse) {
          currentUser = Resource.success(data: value.user!);
          SharePrefUtil.getInstance().setSaveUserName(userName);
          SharePrefUtil.getInstance().setSavePassword(password);
        } else {
          value as RegisterErrorDto;
          var error = value.errors?[0];
          if (error != null) {
            if (error.constraints?.isEmail != null) {
              currentUser = Resource.failure(error.constraints!.isEmail!);
            } else if (error.constraints?.isExist != null) {
              currentUser = Resource.failure("Ten dang nhap da ton tai");
            }
          }
        }
      });
    }
  }

  Future<bool> updateProfile(
      String? name, String? phone, DateTime? birthday) async {
    var dto = UpdateProfileDto(
        name: name, phone: phone, dob: birthday?.toIso8601String());
    return await apiHelper.updateProfile(accessToken, dto).then((value) {
      print(value.user);
      if (value.user != null) {
        currentUser = Resource.success(data: value.user!);
        notifyListeners();
        return Future(() => true);
      } else {
        return Future(() => false);
      }
    });
  }
}
