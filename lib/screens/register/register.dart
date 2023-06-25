import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/screens/home/home.dart';
import 'package:mini_project/screens/login/login.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String name = '', email = '', password = '', confirmPassword = '';
  bool hidePassword = true;

  @override
  void dispose() {
    nameController.dispose();
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
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: myPrimaryColor,
          image: DecorationImage(
            image: AssetImage('assets/images/topBg.png'),
            repeat: ImageRepeat.repeat,
            opacity: .35,
          ),
        ),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: height * .68,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: myBgColorLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    children: [
                      const CMText(
                        text: 'Fill this form to create an acoount',
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: SizedBox(
                          height: 60,
                          child: TextField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
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
                              labelText: 'Full name',
                              hintText: 'John Smith',
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black45,
                              ),
                              suffixIcon: nameController.text.isEmpty
                                  ? const SizedBox(
                                      width: 0,
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        name = '';
                                        nameController.clear();
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.black45,
                                      ),
                                    ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                name = value;
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
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: SizedBox(
                          width: width * .95,
                          height: 60,
                          child: TextField(
                            controller: confirmPasswordController,
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
                              labelText: 'Confirm Password',
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
                                confirmPassword = value;
                              });
                            },
                            // onSubmitted: (value) {
                            //   signInWithEmailAndPassword();
                            // },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: CMButton(
                          text: 'Register',
                          textSize: 22,
                          width: width * .95,
                          onPressed: () {
                            //add function later
                            nextScreen(context, const Home());
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CMText(text: 'Alreaady have an account? '),
                            GestureDetector(
                              onTap: () {
                                //add function later
                                nextScreen(context, const Login());
                              },
                              child: const CMText(
                                text: 'Login now',
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
