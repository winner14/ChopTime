import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final emailController = TextEditingController();
  String email = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
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
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: height * .8,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: myBgColorLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CMText(
                      text: 'Enter your email address',
                      fontSize: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: SizedBox(
                        width: width * .95,
                        height: 60,
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) => email!.isEmpty
                              ? 'Please enter your email'
                              : !email.contains('@')
                                  ? 'Please enter a valid email'
                                  : null,
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
                    // const CMText(
                    //   text: 'A password reset link will be sent to your email',
                    //   fontSize: 16,
                    //   color: Colors.black54,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: CMButton(
                        text: 'Send',
                        textSize: 20,
                        onPressed: () {
                          resetPassword();
                        },
                        width: width * .95,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
                'Password reset link sent to $email. \nCheck your email inbox or spams'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, myPrimaryColor, e.message.toString());
    }
  }
}
