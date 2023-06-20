import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:mini_project/widgets/image/genie_image.dart';
import 'package:mini_project/widgets/text/genie_text.dart';
import 'package:mini_project/screens/home/home.dart';

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
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(130),
                  bottomRight: Radius.circular(130),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/topBg.png'),
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.repeat,
                  opacity: 0.35,
                ),
              ),
            ),
            Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.all(
                    //   Radius.circular(100),
                    // ),
                    shape: BoxShape.circle,
                    color: kSecondaryColor,
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 6,
                    )),
                transform: Matrix4.translationValues(0, -90, 0),
                child: const ClipOval(
                  child: GenieImage(
                    image: 'assets/images/logo.png',
                    fit: 'fill',
                  ),
                )),
            Container(
              transform: Matrix4.translationValues(0, -75, 0),
              child: const GenieText(
                text: 'Login',
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, -70, 0),
              child: Column(
                children: [
                  SizedBox(
                    width: width * .95,
                    height: 50,
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                            color: Color(0xA0000000), fontSize: 18),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kSecondaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(30),
                            left: Radius.circular(30),
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(30),
                            left: Radius.circular(30),
                          ),
                          // borderSide: BorderSide(color: borderColor, width: borderWidth),
                        ),
                        iconColor: kSecondaryColor,
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
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: width * .95,
                    height: 50,
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
                            color: kSecondaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(30),
                            left: Radius.circular(30),
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(30),
                            left: Radius.circular(30),
                          ),
                          // borderSide: BorderSide(color: borderColor, width: borderWidth),
                        ),
                        iconColor: kSecondaryColor,
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
                  const SizedBox(
                    height: 5,
                  ),
                  GenieButton(
                    text: 'Continue',
                    textColor: emailController.text.isEmpty ||
                            passwordController.text.isEmpty
                        ? kPrimaryColor
                        : Colors.white,
                    color: emailController.text.isEmpty ||
                            passwordController.text.isEmpty
                        ? Colors.white
                        : kSecondaryColor,
                    width: width * 0.95,
                    borderColor: kSecondaryColor,
                    borderWidth: 2,
                    onPressed: () {
                      nextScreen(context, const Home());
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              transform: Matrix4.translationValues(0, -70, 0),
              child: const GenieText(text: 'OR'),
            ),
            Container(
              transform: Matrix4.translationValues(0, -65, 0),
              child: GenieButton(
                text: 'Sign in with GOOGLE',
                width: width * 0.95,
                borderColor: kSecondaryColor,
                borderWidth: 2,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
