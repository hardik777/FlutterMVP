
import 'package:login_mvp/data/rest_ds.dart';
import 'package:login_mvp/model/user_info_response.dart';


abstract class SplashView {
  void onUserInfoSuccess(UserInfoResponse data);

  void onError(int errorCode);
}

class SplashPresenter {
  SplashView view;
  RestDataSource api = RestDataSource();

  SplashPresenter(this.view);

  getUserInfo() async {
    try {
      var data = await api.getUserInfo();
      view.onUserInfoSuccess(data);
    } on Exception catch (error) {
      view.onError(int.parse(error.toString().replaceAll("Exception: ", "")));
    }
  }
}
