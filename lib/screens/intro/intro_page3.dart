import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/image/genie_image.dart';
import 'package:mini_project/widgets/text/genie_text.dart';

class GenieIntro3 extends StatelessWidget {
  const GenieIntro3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        image: DecorationImage(
          image: AssetImage('assets/images/topBg.png'),
          // fit: BoxFit.fill,
          repeat: ImageRepeat.repeat,
          opacity: 0.35,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          const GenieText(
            text: 'Explore a world of flavors',
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: kBackgroundColor,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 230,
            transform: Matrix4.translationValues(0, 70, 0),
            child: const GenieImage(image: 'assets/images/intro3.png'),
          ),
          const SizedBox(
            height: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: GenieText(
                    text:
                        'Genie creates personalized recipes based on what you have, so you can enjoy cooking and try new dishes',
                    fontSize: 19,
                    fontWeight: FontWeight.w400,
                    color: kBackgroundColor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
