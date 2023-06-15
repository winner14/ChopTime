import 'package:flutter/material.dart';
import 'package:mini_project/widgets/text/genie_text.dart';

const kPrimaryColor = Color(0xFF4CAF50);
const kSecondaryColor = Color(0xFFCFB53B);
const kPrimaryTextColor = Color(0xFFD4AF37);
const kSecondaryTextColor = Color(0xFF757575);
const kPrimaryDarkColor = Color(0xFF388E3C);
const kBackgroundColor = Color(0xFFfafafa);
const kAppBgColorDark = Colors.black;
const kAppBgColorLight = Colors.white;

//next screen
void nextScreen(context, screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

//snackbar
void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: GenieText(
        text: message,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Okay',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}

//snackbar without action
void showSnackbarWithoutAction(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: GenieText(
        text: message,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 5),
    ),
  );
}
