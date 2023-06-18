import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/image/genie_image.dart';
import 'package:mini_project/widgets/text/genie_text.dart';

class GenieIntro1 extends StatelessWidget {
  const GenieIntro1({super.key});

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 70),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: GenieText(
              text: 'Discover recipes made just for you',
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: kBackgroundColor,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 250,
            transform: Matrix4.translationValues(0, 30, 0),
            child: const GenieImage(image: 'assets/images/intro1.png'),
          ),
          const SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: GenieText(
                    text:
                        'Genie uses the ingredients you have to create delicious dishes with a touch of magic',
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
