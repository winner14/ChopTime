import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:mini_project/widgets/line/line.dart';
import 'package:mini_project/widgets/text/choptime_text.dart';
import 'package:mini_project/widgets/text_input/choptime_text_input.dart';

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
                    bottomRight: Radius.circular(130)),
              ),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                color: kSecondaryColor,
              ),
              transform: Matrix4.translationValues(0, -50, 0),
            ),
            Container(
              transform: Matrix4.translationValues(0, -45, 0),
              child: const ChopTimeText(
                text: 'Login',
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, -40, 0),
              child: Column(
                children: [
                  ChopTimeTextInput(
                    width: width * 0.95,
                    height: 50,
                    borderRadius: 30,
                    label: 'Email',
                    hint: 'user@email.com',
                    email: email,
                    emailController: emailController,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ChopTimeTextInput(
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
                  ChopTimeButton(
                    text: 'Continue',
                    color: emailController.text.isEmpty &&
                            passwordController.text.isEmpty
                        ? Colors.transparent
                        : kSecondaryColor,
                    width: width * 0.95,
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              transform: Matrix4.translationValues(0, -40, 0),
              child: const ChopTimeText(text: 'OR'),
            ),
            Container(
              transform: Matrix4.translationValues(0, -35, 0),
              child: ChopTimeButton(
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
