import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/screens/auth/login/login.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _RegisterState extends State<Register> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  String firstName = '',
      lastName = '',
      email = '',
      password = '',
      confirmPassword = '';
  bool hidePassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    emailFocusNode.dispose();
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: height * .76,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? myBgColorDark
                        : myBgColorLight,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CMText(
                            text: 'Fill this form to create an acoount',
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? myTextColorDark
                                    : myTextColorLight,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? myFgColorDark
                                    : myFgColorLight,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                              ),
                              child: TextField(
                                controller: firstNameController,
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
                                  label: CMText(
                                    text: 'First Name',
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myTextColorDark
                                        : myTextColorLight,
                                  ),
                                  hintText: 'John',
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myTextColorDark
                                        : myTextColorLight,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myTextColorDark
                                        : myTextColorLight,
                                  ),
                                  suffixIcon: firstNameController.text.isEmpty
                                      ? const SizedBox(
                                          width: 0,
                                        )
                                      : IconButton(
                                          onPressed: () {
                                            firstName = '';
                                            firstNameController.clear();
                                          },
                                          icon: Icon(
                                            Icons.close,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? myTextColorDark
                                                    : myTextColorLight,
                                          ),
                                        ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    value[0].toUpperCase();
                                    firstName = value.trim();
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? myFgColorDark
                                    : myFgColorLight,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                              ),
                              child: TextField(
                                controller: lastNameController,
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
                                  label: CMText(
                                    text: 'Last Name',
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myTextColorDark
                                        : myTextColorLight,
                                  ),
                                  hintText: 'Smith',
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myTextColorDark
                                        : myTextColorLight,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myTextColorDark
                                        : myTextColorLight,
                                  ),
                                  suffixIcon: firstNameController.text.isEmpty
                                      ? const SizedBox(
                                          width: 0,
                                        )
                                      : IconButton(
                                          onPressed: () {
                                            lastName = '';
                                            lastNameController.clear();
                                          },
                                          icon: Icon(
                                            Icons.close,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? myTextColorDark
                                                    : myTextColorLight,
                                          ),
                                        ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    value[0].toUpperCase();
                                    lastName = value.trim();
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Container(
                              width: width * .95,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? myFgColorDark
                                    : myFgColorLight,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                              ),
                              child: TextFormField(
                                controller: emailController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (email) => email!.isEmpty
                                    ? 'Please enter your email'
                                    : !email.contains('@')
                                        ? 'Please enter a valid email'
                                        : null,
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
                                  label: CMText(
                                    text: 'Email',
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myTextColorDark
                                        : myTextColorLight,
                                  ),
                                  hintText: 'user@email.com',
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myTextColorDark
                                        : myTextColorLight,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myTextColorDark
                                        : myTextColorLight,
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
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? myTextColorDark
                                                    : myTextColorLight,
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
                            child: Container(
                              width: width * .95,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? myFgColorDark
                                    : myFgColorLight,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                              ),
                              child: TextFormField(
                                controller: passwordController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (password) => password!.isEmpty
                                    ? 'Please enter your password'
                                    : password.length < 6
                                        ? 'Password must be at least 6 characters'
                                        : null,
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
                                  label: CMText(
                                    text: 'Password',
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myTextColorDark
                                        : myTextColorLight,
                                  ),
                                  hintText: '********',
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? myTextColorDark
                                          : myTextColorLight,
                                      fontSize: 18),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myTextColorDark
                                        : myTextColorLight,
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
                                              Brightness.dark
                                          ? myTextColorDark
                                          : myTextColorLight,
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
                            child: Container(
                              width: width * .95,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? myFgColorDark
                                    : myFgColorLight,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                              ),
                              child: TextFormField(
                                controller: confirmPasswordController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (confirmPassword) =>
                                    confirmPassword!.isEmpty
                                        ? 'Please confirm your password'
                                        : confirmPassword != password
                                            ? 'Passwords do not match'
                                            : null,
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
                                  label: CMText(
                                    text: 'Confirm Password',
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myTextColorDark
                                        : myTextColorLight,
                                  ),
                                  hintText: '********',
                                  hintStyle: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? myTextColorDark
                                          : myTextColorLight,
                                      fontSize: 18),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myTextColorDark
                                        : myTextColorLight,
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
                                              Brightness.dark
                                          ? myTextColorDark
                                          : myTextColorLight,
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
                              onPressed: () async {
                                // nextScreen(context, const Home());
                                await signUpWithEmailAndPassword();
                                if (FirebaseAuth.instance.currentUser != null) {
                                  final user = User(
                                    id: FirebaseAuth.instance.currentUser!.uid,
                                    firstName: firstName,
                                    lastName: lastName,
                                    email: email,
                                  );
                                  await createUser(user);
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CMText(
                                  text: 'Alreaady have an account? ',
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? myTextColorDark
                                      : myTextColorLight,
                                ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createUser(User user) async {
    final formIsValid = _formKey.currentState!.validate();
    if (!formIsValid) {
      return;
    }

    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = FirebaseAuth.instance.currentUser!.uid;

    final json = user.toJson();
    await docUser.set(json);
  }

  Future signUpWithEmailAndPassword() async {
    final formIsValid = _formKey.currentState!.validate();
    if (!formIsValid) {
      return showSnackbarWithoutAction(
          context, Colors.red, 'Please fill in all fields');
    }

    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // final UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbar(
            context, Colors.green, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackbar(context, Colors.green,
            'The account already exists for that email.');
      }
    } catch (e) {
      showSnackbar(context, Colors.green, e.toString());
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

class User {
  String id;
  final String firstName;
  final String lastName;
  final String email;

  User({
    this.id = '',
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
      };
}
