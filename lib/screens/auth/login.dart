// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:login_mvp/common/check_response_code.dart';
import 'package:login_mvp/common/utils.dart';
import 'package:login_mvp/model/user_info_response.dart';
import 'package:login_mvp/presenter/login_presenter.dart';
import 'package:login_mvp/utils/color.dart';
import 'package:login_mvp/utils/images.dart';
import 'package:login_mvp/utils/preference.dart';
import 'package:login_mvp/utils/string.dart';
import 'package:login_mvp/utils/widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> implements LoginView {
  LoginPresenter? _presenter;

  _LoginState() {
    _presenter = LoginPresenter(this);
  }

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onClickSignIn() {
    if (userNameController.text.isEmpty) {
      toastMassage(usernameError);
      return;
    }
    if (passwordController.text.isEmpty) {
      toastMassage(passwordError);
      return;
    }
    _presenter!.doLogin(userNameController.text.toString().trim(),
        passwordController.text.toString().trim());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verticalViewBig(),
                        Text(
                          signIn,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        verticalViewBig(),
                        Text(
                          userName,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        verticalView(),
                        textField(context, userNameController, userNameHint,
                            icUser, false),
                        verticalViewBig(),
                        Text(
                          password,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        verticalView(),
                        textField(context, passwordController, passwordHint,
                            icPassword, true),
                        verticalViewBig(),
                        verticalView(),
                        InkWell(
                            onTap: (() {
                              onClickSignIn();
                            }),
                            child: btn(context, signIn))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onLoginSuccess(UserInfoResponse data) {
    toastMassage(loginSuccess);
  }

  @override
  void onError(int errorCode) {
    if (errorCode == 401) {
      Utils.howMyDialogNew(context, loginAlert);
    } else {
      CheckResponseCode.getResponseCode(errorCode, context);
    }
  }
}
