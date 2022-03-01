import 'dart:async';

import 'package:login_mvp/model/user_info_response.dart';
import 'package:login_mvp/utils/preference.dart';

import 'constant.dart';
import 'network_util.dart';

class RestDataSource {
  final NetworkUtil _netUtil = NetworkUtil();

  Future<UserInfoResponse> getUserInfo() {
    return _netUtil
        .get(url: Constant.getUserInfo, isLoadVisible: false)
        .then((dynamic res) {
      return UserInfoResponse.fromJson(res);
    });
  }

  Future<UserInfoResponse> doLogin(String userName, String password) {
    Map requestBody = {
      'username': userName,
      'password': password,
      'fcm_token': PreferenceData.getFCMToken()
    };
    return _netUtil.post(Constant.login, body: requestBody).then((dynamic res) {
      return UserInfoResponse.fromJson(res);
    });
  }

}
