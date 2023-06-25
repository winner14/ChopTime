import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/screens/home/home.dart';
import 'package:mini_project/screens/register/register.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String email = '';
  String password = '';
  bool hidePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              opacity: .35),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Image(image: AssetImage('assets/images/login_pic.png')),
            ),
            Container(
              width: double.infinity,
              height: height * .6,
              decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? myBgColorLight
                      : myBgColorDark,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6.0),
                    child: CMText(
                      text: 'Login',
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: SizedBox(
                      width: width * .95,
                      height: 60,
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                              color: Color(0xA0000000), fontSize: 18),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: mySecondaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(15),
                              left: Radius.circular(15),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(15),
                              left: Radius.circular(15),
                            ),
                            // borderSide: BorderSide(color: borderColor, width: borderWidth),
                          ),
                          iconColor: mySecondaryColor,
                          labelText: 'Email',
                          hintText: 'user@email.com',
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.black45,
                          ),
                          suffixIcon: emailController.text.isEmpty
                              ? const SizedBox(
                                  width: 0,
                                )
                              : IconButton(
                                  onPressed: () {
                                    email = '';
                                    emailController.clear();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.black45,
                                  ),
                                ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: SizedBox(
                      width: width * .95,
                      height: 60,
                      child: TextField(
                        controller: passwordController,
                        obscureText: hidePassword,
                        // keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                              color: Color(0xA0000000), fontSize: 18),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: mySecondaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(15),
                              left: Radius.circular(15),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(15),
                              left: Radius.circular(15),
                            ),
                            // borderSide: BorderSide(color: borderColor, width: borderWidth),
                          ),
                          iconColor: mySecondaryColor,
                          labelText: 'Password',
                          hintText: '********',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.black45,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            icon: const Icon(
                              Icons.remove_red_eye,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        // onSubmitted: (value) {
                        //   signInWithEmailAndPassword();
                        // },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: GestureDetector(
                      onTap: () {
                        // add function later
                      },
                      child: const CMText(
                        text: "Forgot password?",
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: CMButton(
                      text: 'Continue',
                      textSize: 22,
                      textColor:
                          Theme.of(context).brightness == Brightness.light
                              ? mySecondaryTextColor
                              : myPrimaryTextColor,
                      color: emailController.text.isEmpty ||
                              passwordController.text.isEmpty
                          ? myBgColorLight
                          : mySecondaryColor,
                      width: width * 0.95,
                      borderColor: mySecondaryColor,
                      borderWidth: 2,
                      onPressed: () {
                        nextScreen(context, const Home());
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.0),
                    child: CMText(
                      text: 'OR',
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: CMButton(
                      text: 'Sign in with GOOGLE',
                      width: width * 0.95,
                      borderColor: mySecondaryColor,
                      borderWidth: 2,
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CMText(text: "Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            nextScreen(context, const Register());
                          },
                          child: const CMText(
                            text: 'Register now',
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:mini_project/constants.dart';
// import 'package:mini_project/screens/register/register.dart';
// import 'package:mini_project/widgets/button/button.dart';
// import 'package:mini_project/widgets/image/cm_image.dart';
// import 'package:mini_project/widgets/text/cm_text.dart';
// import 'package:mini_project/screens/home/home.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   String email = '';
//   String password = '';
//   bool hidePassword = true;

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: myBackgroundColor,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               height: 300,
//               decoration: const BoxDecoration(
//                 color: myPrimaryColor,
//                 // borderRadius: BorderRadius.only(
//                 //   bottomLeft: Radius.circular(130),
//                 //   bottomRight: Radius.circular(130),
//                 // ),
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/topBg.png'),
//                   fit: BoxFit.cover,
//                   repeat: ImageRepeat.repeat,
//                   opacity: 0.35,
//                 ),
//               ),
//             ),
//             Container(
//               transform: Matrix4.translationValues(0, -75, 0),
//               child: const CMText(
//                 text: 'Login',
//                 fontSize: 25,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             Container(
//               transform: Matrix4.translationValues(0, -70, 0),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     width: width * .95,
//                     height: 50,
//                     child: TextField(
//                       controller: emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       textInputAction: TextInputAction.next,
//                       decoration: InputDecoration(
//                         labelStyle: const TextStyle(
//                             color: Color(0xA0000000), fontSize: 18),
//                         focusedBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: mySecondaryColor,
//                             width: 2,
//                           ),
//                           borderRadius: BorderRadius.horizontal(
//                             right: Radius.circular(15),
//                             left: Radius.circular(15),
//                           ),
//                         ),
//                         contentPadding:
//                             const EdgeInsets.symmetric(horizontal: 15),
//                         border: const OutlineInputBorder(
//                           borderRadius: BorderRadius.horizontal(
//                             right: Radius.circular(15),
//                             left: Radius.circular(15),
//                           ),
//                           // borderSide: BorderSide(color: borderColor, width: borderWidth),
//                         ),
//                         iconColor: mySecondaryColor,
//                         labelText: 'Email',
//                         hintText: 'user@email.com',
//                         prefixIcon: const Icon(
//                           Icons.email,
//                           color: Colors.black45,
//                         ),
//                         suffixIcon: emailController.text.isEmpty
//                             ? const SizedBox(
//                                 width: 0,
//                               )
//                             : IconButton(
//                                 onPressed: () {
//                                   email = '';
//                                   emailController.clear();
//                                 },
//                                 icon: const Icon(
//                                   Icons.close,
//                                   color: Colors.black45,
//                                 ),
//                               ),
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           email = value;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   SizedBox(
//                     width: width * .95,
//                     height: 50,
//                     child: TextField(
//                       controller: passwordController,
//                       obscureText: hidePassword,
//                       // keyboardType: TextInputType.visiblePassword,
//                       textInputAction: TextInputAction.done,
//                       decoration: InputDecoration(
//                         labelStyle: const TextStyle(
//                             color: Color(0xA0000000), fontSize: 18),
//                         focusedBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: mySecondaryColor,
//                             width: 2,
//                           ),
//                           borderRadius: BorderRadius.horizontal(
//                             right: Radius.circular(15),
//                             left: Radius.circular(15),
//                           ),
//                         ),
//                         contentPadding:
//                             const EdgeInsets.symmetric(horizontal: 15),
//                         border: const OutlineInputBorder(
//                           borderRadius: BorderRadius.horizontal(
//                             right: Radius.circular(15),
//                             left: Radius.circular(15),
//                           ),
//                           // borderSide: BorderSide(color: borderColor, width: borderWidth),
//                         ),
//                         iconColor: mySecondaryColor,
//                         labelText: 'Password',
//                         hintText: '********',
//                         prefixIcon: const Icon(
//                           Icons.lock,
//                           color: Colors.black45,
//                         ),
//                         suffixIcon: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               hidePassword = !hidePassword;
//                             });
//                           },
//                           icon: const Icon(
//                             Icons.remove_red_eye,
//                             color: Colors.black45,
//                           ),
//                         ),
//                       ),
//                       onChanged: (value) {
//                         setState(() {
//                           password = value;
//                         });
//                       },
//                       // onSubmitted: (value) {
//                       //   signInWithEmailAndPassword();
//                       // },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // add function later
//                     },
//                     child: const CMText(
//                       text: "Forgot password?",
//                       color: Colors.red,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 3,
//                   ),
//                   CMButton(
//                     text: 'Continue',
//                     textColor: emailController.text.isEmpty ||
//                             passwordController.text.isEmpty
//                         ? myPrimaryColor
//                         : myBackgroundColor,
//                     color: emailController.text.isEmpty ||
//                             passwordController.text.isEmpty
//                         ? myBackgroundColor
//                         : mySecondaryColor,
//                     width: width * 0.95,
//                     borderColor: mySecondaryColor,
//                     borderWidth: 2,
//                     onPressed: () {
//                       nextScreen(context, const Home());
//                     },
//                   )
//                 ],
//               ),
//             ),
//             // const SizedBox(
//             //   height: 5,
//             // ),
//             Container(
//               transform: Matrix4.translationValues(0, -70, 0),
//               child: const CMText(text: 'OR'),
//             ),
//             Container(
//               transform: Matrix4.translationValues(0, -65, 0),
//               child: CMButton(
//                 text: 'Sign in with GOOGLE',
//                 width: width * 0.95,
//                 borderColor: mySecondaryColor,
//                 borderWidth: 2,
//                 onPressed: () {},
//               ),
//             ),
//             Container(
//               transform: Matrix4.translationValues(0, -58, 0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CMText(text: "Don't have an account? "),
//                   GestureDetector(
//                     onTap: () {
//                       nextScreen(context, const Register());
//                     },
//                     child: const CMText(
//                       text: 'Register now',
//                       color: Colors.red,
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
