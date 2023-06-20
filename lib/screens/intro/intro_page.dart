import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/screens/intro/intro_page1.dart';
import 'package:mini_project/screens/intro/intro_page2.dart';
import 'package:mini_project/screens/intro/intro_page3.dart';
import 'package:mini_project/screens/login/login.dart';
import 'package:mini_project/widgets/text/genie_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GenieIntro extends StatefulWidget {
  const GenieIntro({super.key});

  @override
  State<GenieIntro> createState() => _GenieIntroState();
}

class _GenieIntroState extends State<GenieIntro> {
  final PageController _controller = PageController();
  bool lastPage = false;
  bool firstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                lastPage = (index == 2);
                firstPage = (index == 0);
              });
            },
            controller: _controller,
            children: const [
              GenieIntro1(),
              GenieIntro2(),
              GenieIntro3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    firstPage
                        ? _controller.jumpToPage(2)
                        : _controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                  },
                  child: firstPage == true
                      ? const GenieText(
                          text: 'Skip',
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        )
                      : const GenieText(
                          text: 'Back',
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),
                GestureDetector(
                  onTap: () {
                    lastPage == true
                        ? nextScreen(context, const Login())
                        : _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                  },
                  child: lastPage == true
                      ? const GenieText(
                          text: 'Start',
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        )
                      : const GenieText(
                          text: 'Next',
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
