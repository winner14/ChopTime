import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/image/genie_image.dart';
import 'package:mini_project/widgets/text/genie_text.dart';

class GenieIntro2 extends StatelessWidget {
  const GenieIntro2({super.key});

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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: GenieText(
              text: 'No more kitchen stress',
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: kBackgroundColor,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 230,
            transform: Matrix4.translationValues(0, 70, 0),
            child: const GenieImage(image: 'assets/images/intro2.png'),
          ),
          const SizedBox(
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: GenieText(
                    text:
                        'Genie turns your ingredients into easy and delicious recipes, making cooking a breeze',
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
