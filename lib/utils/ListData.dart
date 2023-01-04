import 'package:hellojob/model/User.dart';
import 'package:hellojob/model/UserInfo.dart';

import '../model/FieldData.dart';

List<User> myList = [
  User(
      userInfo: UserInfo(
          email: 'email',
          name: 'name',
          phone: 'phone',
          job: 'job',
          disabled: true,
          role: 'role',
          eligibility: 'eligibility',
          immigration: 'immigration',
          status: 'status',
          fieldData: FieldData(),
          jobId: 'jobId',
          companyId: 'companyId'),
      message: "message",
      accessToken: "accessToken",
      refreshToken: "refreshToken")
];
