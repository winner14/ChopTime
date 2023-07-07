import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myBgColorLight,
      child: const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: CircularProgressIndicator(
                  backgroundColor: myPrimaryColor,
                  color: mySecondaryColor,
                ),
              ),
              CMText(
                text: 'Just a moment... Please wait.',
                fontSize: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
