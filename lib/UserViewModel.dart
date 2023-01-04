import 'package:flutter/foundation.dart';
import 'package:hellojob/util/Resource/Resource.dart';
import 'package:hellojob/util/SharePrefUtil.dart';

import 'api/ApiHelper.dart' as apiHelper;
import 'model/User.dart';

class UserState extends ChangeNotifier {
  static UserState? _instance;

  static UserState getInstance() {
    _instance ??= UserState();
    return _instance!;
  }

  Resource<User> currentUser = Resource.loading();

  Future<void> getUserFromLocal() async {
    var saveUserName = SharePrefUtil.getInstance().saveUserName;
    var savePassword = SharePrefUtil.getInstance().savePassword;
    if (saveUserName?.isNotEmpty == true && savePassword?.isNotEmpty == true) {
      await apiHelper.login(saveUserName!, savePassword!).then((value) {
            if (value.user != null){
              currentUser = Resource.success(data: value.user!);
            }
            else {
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
      if (value.user != null) {
        currentUser = Resource.success(data: value.user!);
        SharePrefUtil.getInstance().setSaveUserName(userName);
        SharePrefUtil.getInstance().setSavePassword(password);
      } else {
        currentUser = Resource.failure(value.message!) as Resource<User>;
      }
      notifyListeners();
    });
  }
}
