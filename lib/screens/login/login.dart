import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:mini_project/widgets/image/genie_image.dart';
import 'package:mini_project/widgets/line/line.dart';
import 'package:mini_project/widgets/text/genie_text.dart';
import 'package:mini_project/widgets/text_input/genie_text_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    String email = '';
    String password = '';
    // bool hidePassword = true;

    return Scaffold(
      // appBar: AppBar(),
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
                    fit: BoxFit.fill,
                    opacity: 0.4),
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
                  GenieTextInput(
                    width: width * 0.95,
                    height: 50,
                    borderRadius: 30,
                    icon: const Icon(Icons.email),
                    label: 'Email',
                    hint: 'user@email.com',
                    email: email,
                    emailController: emailController,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GenieTextInput(
                    width: width * 0.95,
                    height: 50,
                    borderRadius: 30,
                    icon: const Icon(Icons.lock),
                    label: 'Password',
                    hint: '********',
                    password: password,
                    passwordController: passwordController,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GenieButton(
                    text: 'Continue',
                    color: emailController.text.isEmpty &&
                            passwordController.text.isEmpty
                        ? const Color(0x23000000)
                        : kSecondaryColor,
                    width: width * 0.95,
                    borderColor: kSecondaryColor,
                    borderWidth: 1.2,
                    onPressed: () {},
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
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
