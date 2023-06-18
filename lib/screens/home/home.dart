import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/text/genie_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   // title: const GenieText(
      //   //   text: 'Genie',
      //   //   fontSize: 35,
      //   //   fontWeight: FontWeight.w500,
      //   // ),
      // ),
      // extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            height: height * .20,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              image: DecorationImage(
                image: AssetImage('assets/images/topBg.png'),
                fit: BoxFit.cover,
                repeat: ImageRepeat.repeat,
                opacity: 0.35,
              ),
            ),
            child: const Column(
              children: [
                SizedBox(height: 40),
                Row(
                  children: [
                    Column(
                      children: [
                        GenieText(
                          text: 'Welcome',
                          color: kBackgroundColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                        GenieText(
                          text: '(User Name)', //add function for name later
                          color: kBackgroundColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
