import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:login_mvp/utils/images.dart';

import 'color.dart';

void toastMassage(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 12.0);
}

void internetAlert() {
  AlertDialog buildAlertDialog() {
    return const AlertDialog(
      title: Text(
        "You are not Connected to Internet",
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }
}

bool validateEmail(String value) {
  if (value.isEmpty) {
    // The form is empty
    return false;
  }
  // This is just a regular expression for email addresses
  String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
      "\\@" +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
      "(" +
      "\\." +
      "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
      ")+";
  RegExp regExp = new RegExp(p);

  if (regExp.hasMatch(value)) {
    // So, the email is valid
    return true;
  }

  // The pattern of the email didn't match the regex above.
  return false;
}

bool validateMobile(String value) {
  if (value.length != 10) {
    return false;
  } else {
    return true;
  }
}

TextStyle headline1Regular =
    const TextStyle(fontSize: 16, fontFamily: "Regular", color: colorApp);

Widget verticalView() {
  return const SizedBox(
    height: 10,
  );
}

Widget verticalViewBig() {
  return const SizedBox(
    height: 25,
  );
}

Widget horizontalView() {
  return const SizedBox(
    width: 10,
  );
}

Widget divider() {
  return const Divider(height: 0.5, thickness: 0.2, color: colorLightGray);
}

Widget dividerWithSpace() {
  return const Padding(
    padding: EdgeInsets.only(top: 15, bottom: 15),
    child: Divider(height: 0.5, thickness: 0.2, color: colorLightGray),
  );
}

Widget actionBar(BuildContext context, String title, bool isBack) {
  return Container(
    decoration: const BoxDecoration(
        color: colorApp,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        )),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Visibility(
              visible: isBack,
              child: InkWell(
                  onTap: (() {
                    Get.back();
                  }),
                  child: Image.asset(icBack, height: 25, width: 25))),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
          Visibility(visible: isBack, child: const SizedBox(width: 25))
        ],
      ),
    ),
  );
}

Widget textField(BuildContext context, TextEditingController controller,
    String hint, String icon, bool isPassword) {
  return Container(
    decoration: BoxDecoration(
        color: colorOffWhite,
        border: Border.all(color: colorGray),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        )),
    child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              obscureText: isPassword,
              textAlign: TextAlign.left,
              controller: controller,
              autofocus: false,
              onChanged: (text) {},
              style: Theme.of(context).textTheme.bodyText1,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hint),
            ),
          ),
          Visibility(
            visible: icon.isNotEmpty,
            child: Image.asset(
              icon,
              height: 25,
              width: 25,
            ),
          ),
          const SizedBox(width: 5)
        ],
      ),
    ),
  );
}

Widget btn(BuildContext context, String label) {
  return Container(
    decoration: BoxDecoration(
        color: colorApp,
        border: Border.all(color: colorGray),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        )),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.button,
          ),
        ],
      ),
    ),
  );
}

TextStyle dialogTitle() {
  return const TextStyle(
      fontSize: 19.0, color: colorOffWhite, decoration: TextDecoration.none);
}

TextStyle regularBlackText() {
  return const TextStyle(
      fontSize: 15.0, color: colorOffWhite, decoration: TextDecoration.none);
}

TextStyle mediumTitle() {
  return const TextStyle(fontSize: 16.0, color: colorOffWhite);
}

TextStyle blackTitle() {
  return const TextStyle(fontSize: 16.0, color: colorBlack);
}

TextStyle grayTitle() {
  return const TextStyle(fontSize: 14, fontFamily: "Regular", color: colorGray);
}
