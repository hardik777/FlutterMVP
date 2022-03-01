import 'dart:async';

import 'package:login_mvp/screens/splash.dart';
import 'package:login_mvp/utils/color.dart';
import 'package:login_mvp/utils/preference.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

// ignore: library_prefixes
import 'package:login_mvp/routes/router.dart' as RouterFile;

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  void initState() {
    // super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login MVP',
      home: const Splash(),
      builder: EasyLoading.init(),
      getPages: RouterFile.Router.route,
      theme: ThemeData(
        primaryColor: colorBlack,
        brightness: Brightness.light,
        scaffoldBackgroundColor: colorWhite,
        dialogBackgroundColor: colorBlack,
        dividerColor: Colors.black12,
        cardColor: colorWhite,
        canvasColor: colorWhite,
        hintColor: colorGray,
        accentColor: colorApp,
        bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.white),
        fontFamily: "Regular",
        textTheme: const TextTheme(
          headline1:
          TextStyle(fontSize: 16, fontFamily: "Medium", color: colorApp),
          headline2:
          TextStyle(fontSize: 26, fontFamily: "SemiBold", color: colorApp),
          headline3:
          TextStyle(fontSize: 20, fontFamily: "SemiBold", color: colorApp),
          headline4: TextStyle(
              fontSize: 30, fontFamily: "SemiBold", color: colorWhite),
          bodyText1: TextStyle(
            fontSize: 14,
            fontFamily: "Medium",
            color: colorApp,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontFamily: "Regular",
            color: colorLightGray,
          ),
          subtitle1:
          TextStyle(fontSize: 12, fontFamily: "Regular", color: colorGray),
          subtitle2:
          TextStyle(fontSize: 12, fontFamily: "Regular", color: colorApp),
          button:
          TextStyle(fontSize: 16, fontFamily: "Medium", color: colorWhite),
          overline: TextStyle(fontSize: 10, fontFamily: "Regular"),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(secondary: colorWhite),
      ),
    );
  }
}

