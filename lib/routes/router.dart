import 'package:login_mvp/screens/splash.dart';
import 'package:get/get.dart';

import '../screens/auth/login.dart';

class Router {
  static final route = [
    GetPage(name: '/splash', page: () => const Splash()),
    GetPage(name: '/login', page: () => const Login())
  ];
}
