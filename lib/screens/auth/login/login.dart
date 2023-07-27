import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/screens/auth/reset_password.dart';
import 'package:mini_project/screens/auth/register/register.dart';
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
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  String email = '';
  String password = '';
  bool hidePassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          emailFocus.unfocus();
          passwordFocus.unfocus();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? myPrimaryColorDark
                : myPrimaryColorLight,
            image: DecorationImage(
              image: Theme.of(context).brightness == Brightness.dark
                  ? const AssetImage('assets/images/topBgDark.png')
                  : const AssetImage('assets/images/topBg.png'),
              repeat: ImageRepeat.repeat,
              opacity:
                  Theme.of(context).brightness == Brightness.dark ? .15 : .35,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Padding(
                  //   padding: EdgeInsets.only(top: 50.0),
                  //   child:
                  //       Image(image: AssetImage('assets/images/login_pic.png')),
                  // ),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: CMText(
                            text: 'Login',
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? myTextColorLight
                                    : myTextColorDark,
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: SizedBox(
                                  width: width * .95,
                                  height: 60,
                                  child: TextFormField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    focusNode: emailFocus,
                                    // validator: (email) => email!.isEmpty
                                    //     ? 'Please enter your email'
                                    //     : !email.contains('@')
                                    //         ? 'Please enter a valid email'
                                    //         : null,
                                    decoration: InputDecoration(
                                      labelStyle: const TextStyle(
                                          color: Color(0xA0000000),
                                          fontSize: 18),
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
                                      // iconColor: mySecondaryColor,
                                      // labelText: '',
                                      label: CMText(
                                          text: 'Email',
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? myTextColorDark
                                              : myTextColorLight),
                                      hintStyle: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? myTextColorLight
                                            : myTextColorDark,
                                      ),
                                      hintText: 'user@email.com',
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? myTextColorLight
                                            : myTextColorDark,
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
                                              icon: Icon(
                                                Icons.close,
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.light
                                                    ? myTextColorLight
                                                    : myTextColorDark,
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: SizedBox(
                                  width: width * .95,
                                  height: 60,
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: hidePassword,
                                    focusNode: passwordFocus,
                                    // validator: (password) => password!.isEmpty
                                    //     ? 'Please enter your password'
                                    //     : password.length < 6
                                    //         ? 'Password must be at least 6 characters'
                                    //         : null,
                                    // keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      labelStyle: const TextStyle(
                                          color: Color(0xA0000000),
                                          fontSize: 18),
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
                                      // iconColor: mySecondaryColor,
                                      label: CMText(
                                        text: 'Password',
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? myTextColorLight
                                            : myTextColorDark,
                                      ),
                                      hintText: '********',
                                      hintStyle: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? myTextColorLight
                                            : myTextColorDark,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? myTextColorLight
                                            : myTextColorDark,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            hidePassword = !hidePassword;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove_red_eye,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? myTextColorLight
                                              : myTextColorDark,
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
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              nextScreen(context, const ResetPassword()),
                          child: const SizedBox(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.0),
                              child: CMText(
                                text: "Forgot password?",
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
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
                                    ? myTextColorLight
                                    : myTextColorDark,
                            color: (emailController.text.isEmpty ||
                                        passwordController.text.isEmpty) &&
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                ? myFgColorDark
                                : (emailController.text.isEmpty ||
                                            passwordController.text.isEmpty) &&
                                        Theme.of(context).brightness ==
                                            Brightness.dark
                                    ? myFgColorLight
                                    : mySecondaryColor,
                            // ? myBgColorLight
                            // : mySecondaryColor,
                            width: width * 0.95,
                            borderColor: mySecondaryColor,
                            borderWidth: 2,
                            onPressed: () {
                              // nextScreen(context, const Home());
                              loginWithEmailAndPassword();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: CMText(
                            text: 'OR',
                            fontSize: 20,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? myTextColorLight
                                    : myTextColorDark,
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
                              CMText(
                                text: "Don't have an account? ",
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? myTextColorLight
                                    : myTextColorDark,
                              ),
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
          ),
        ),
      ),
    );
  }

  Future loginWithEmailAndPassword() async {
    final formIsValid = _formKey.currentState!.validate();
    if (!formIsValid) {
      return showSnackbarWithoutAction(
          context, Colors.red, 'Please fill the required fields correctly.');
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar(context, Colors.green, 'No user found for that email.');
        Navigator.pop(context);
      } else if (e.code == 'wrong-password') {
        showSnackbar(
            context, Colors.green, 'Wrong password provided for that user.');
        Navigator.pop(context);
      }
    } catch (e) {
      showSnackbar(context, Colors.green, e.toString());
      Navigator.pop(context);
    }
  }
}
