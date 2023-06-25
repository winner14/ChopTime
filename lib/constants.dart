import 'package:flutter/material.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

const myPrimaryColor = Color(0xFF4CAF50);
const mySecondaryColor = Color(0xFFCFB53B);
const myPrimaryTextColor = Color(0xFFF7FDF7);
const mySecondaryTextColor = Color(0xFF201F1F);
const myPrimaryDarkColor = Color(0xFF4CAF50);
const myBgColorDark = Color(0xFF201F1F);
const myBgColorLight = Color(0xFFF7FDF7);

//next screen
void nextScreen(context, screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

//snackbar
void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: CMText(
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
      content: CMText(
        text: message,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 5),
    ),
  );
}
