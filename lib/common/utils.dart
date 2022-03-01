import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:login_mvp/common/common_log.dart';
import 'package:login_mvp/utils/color.dart';
import 'package:login_mvp/utils/preference.dart';
import 'package:login_mvp/utils/string.dart';
import 'package:login_mvp/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Utils {
  static logoutUser401(BuildContext context, String message) {
    showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: AlertDialog(
              title: Text("Your session has expired", style: dialogTitle()),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(message, style: regularBlackText()),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    alertButton,
                    style: mediumTitle(),
                  ),
                  onPressed: () {
                    PreferenceData.setToken("");
                    Get.offAllNamed('/login');
                  },
                ),
              ],
            ),
          );
        });
  }


  static howMyDialogNew(BuildContext context, String message) {
    showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(appName, style: dialogTitle()),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(message, style: regularBlackText()),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  alertButton,
                  style: mediumTitle(),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  static showProgress() {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.show(status: 'loading...');
  }

  static hideProgress() {
    EasyLoading.dismiss();
  }

  static Future<bool> checkInternetConnection() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    debugPrint(connectivityResult.toString());
    if ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi)) {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }

  static check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      CommonLog.printLog("connected to a network.");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      CommonLog.printLog("connected to a network.");
    } else {
      CommonLog.printLog("NOT connected to a network.");
    }
  }

  static checkNetworkKillDialog(BuildContext context) {
    showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: AlertDialog(
              backgroundColor: colorOffWhite,
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                        checkInternetPermission,
                        style: blackTitle()),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    alertButton,
                    style: blackTitle(),
                  ),
                  onPressed: () {
                    ///For kill application
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    Navigator.pop(context, false);
                  },
                ),
              ],
            ),
          );
        });
  }
}
