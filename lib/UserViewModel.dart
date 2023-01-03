import 'package:hellojob/api/ApiHelper.dart';
import 'package:hellojob/util/Resource/Resource.dart';
import 'package:hellojob/util/SharePrefUtil.dart';
import 'api/ApiHelper.dart' as apiHelper;


import 'model/User.dart';

class UserViewModel {
  static UserViewModel? _instance;

  static UserViewModel getInstance() {
    _instance ??= UserViewModel();
    return _instance!;
  }

  UserViewModel() {
    getUserFromLocal();
  }

  Resource<User> currentUser = Resource.loading() as Resource<User>;

  void getUserFromLocal() async {
    var saveUserName = SharePrefUtil().saveUserName;
    var savePassword = SharePrefUtil().savePassword;
    if (saveUserName?.isNotEmpty == true && savePassword?.isNotEmpty == true) {
      await apiHelper.login(saveUserName!, savePassword!).then((value) =>
      {
        if (value.user != null)
          {currentUser = Resource.success(data: value.user!)}
        else
          {currentUser = Resource.failure(value.message!) as Resource<User>}
      });
    } else {
      currentUser = Resource.failure("") as Resource<User>;
    }
  }

  void login(String userName, String password) async {
    await apiHelper.login(userName, password).then((value) {
      if (value.user != null) {
        currentUser = Resource.success(data: value.user!);
        SharePrefUtil.getInstance().setSaveUserName(userName);
        SharePrefUtil.getInstance().setSavePassword(password);
      } else {
        currentUser = Resource.failure(value.message!) as Resource<User>
      }
    }
    );
  }
}
