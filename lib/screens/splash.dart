import 'dart:async';

import 'package:login_mvp/common/utils.dart';
import 'package:login_mvp/utils/images.dart';
import 'package:login_mvp/utils/string.dart';
import 'package:login_mvp/utils/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _openNextScreen();
  }

  _openNextScreen() {
    Utils.checkInternetConnection().then(
        (value) => {
              if (value)
                {
                  Timer(const Duration(seconds: 1), () {
                    setState(() {
                      Get.offNamed('/login');
                    });
                  }),
                }
              else
                {
                  Utils.checkNetworkKillDialog(context),
                }
            },
        onError: (error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(icLogo, height: 120, width: 120),
              ),
            ),
            Text(
              appName,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            verticalView(),
            verticalViewBig(),
          ],
        ),
      ),
    );
  }
}
