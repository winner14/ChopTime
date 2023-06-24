import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: myPrimaryColor,
          image: DecorationImage(
            image: AssetImage('assets/images/topBg.png'),
            repeat: ImageRepeat.repeat,
            opacity: 0.35,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const CMText(
                text: 'Stress Free Cooking For Everyone',
                color: myPrimaryTextColor,
                fontSize: 30,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: CMText(
                  text:
                      'Find a wide range of recipes made just for you.\nJust input your ingredients and start cooking.',
                  color: myPrimaryTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
              ),
              CMButton(
                text: 'Get stated',
                onPressed: () {
                  //add function later
                },
                color: mySecondaryColor,
                width: width * .9,
                textSize: 26,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ),
      ),
    );
  }
}
