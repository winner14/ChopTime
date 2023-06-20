import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/image/genie_image.dart';
import 'package:mini_project/widgets/text/genie_text.dart';
import 'package:mini_project/widgets/text_input/genie_text_input.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchController = TextEditingController();
  String search = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          image: DecorationImage(
            image: AssetImage('assets/images/topBg.png'),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
            opacity: 0.35,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: height * .18,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                // image: DecorationImage(
                //   image: AssetImage('assets/images/topBg.png'),
                //   fit: BoxFit.cover,
                //   repeat: ImageRepeat.repeat,
                //   opacity: 0.35,
                // ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 38),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GenieText(
                              text:
                                  'Hello, Winner', //add function for name later
                              color: kBackgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            GenieText(
                              text: 'Ready for a Meal?',
                              color: kBackgroundColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: CircleAvatar(
                            child: GenieImage(
                              image: 'assets/images/boy_profile.png',
                              fit: 'fill',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * .82,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextField(
                        controller: searchController,
                        // obscureText: hidePassword,
                        // keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: '',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                // hidePassword = !hidePassword;
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            search = value;
                          });
                        },
                        onSubmitted: (value) {
                          // signInWithEmailAndPassword();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
