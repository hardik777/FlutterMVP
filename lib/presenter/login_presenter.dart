
import 'package:login_mvp/data/rest_ds.dart';
import 'package:login_mvp/model/user_info_response.dart';


abstract class LoginView {
  void onLoginSuccess(UserInfoResponse data);

  void onError(int errorCode);
}

class LoginPresenter {
  LoginView view;
  RestDataSource api = RestDataSource();

  LoginPresenter(this.view);

  doLogin(String userName, String password ) async {
    try {
      var data = await api.doLogin(userName, password);
      view.onLoginSuccess(data);
    } on Exception catch (error) {
      view.onError(int.parse(error.toString().replaceAll("Exception: ", "")));
    }
  }

}
