import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

// final navigatorKey = GlobalKey<NavigatorState>();

class _EditProfileState extends State<EditProfile> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  String firstName = '', lastName = '', email = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const CMText(
          text: 'Edit Profile',
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _firstNameFocusNode.unfocus();
          _lastNameFocusNode.unfocus();
          _emailFocusNode.unfocus();
        },
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
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
                  children: [
                    Container(
                      height: height * .65,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? myBgColorDark
                            : myBgColorLight,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myFgColorDark
                                        : myFgColorLight,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  height: 60,
                                  child: TextFormField(
                                    controller: firstNameController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your first name';
                                      }
                                      return null;
                                    },
                                    focusNode: _firstNameFocusNode,
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
                                      iconColor: mySecondaryColor,
                                      hintStyle: TextStyle(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? myTextColorDark
                                            : myTextColorLight,
                                      ),
                                      label: CMText(
                                        text: 'First name',
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? myTextColorDark
                                            : myTextColorLight,
                                      ),
                                      hintText: 'John',
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? myTextColorDark
                                            : myTextColorLight,
                                      ),
                                      suffixIcon:
                                          firstNameController.text.isEmpty
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
                                                    color: Theme.of(context)
                                                                .brightness ==
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myFgColorDark
                                        : myFgColorLight,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextFormField(
                                    controller: lastNameController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your last name';
                                      }
                                      return null;
                                    },
                                    focusNode: _lastNameFocusNode,
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
                                      iconColor: mySecondaryColor,
                                      label: CMText(
                                        text: 'Last ame',
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
                                      suffixIcon:
                                          lastNameController.text.isEmpty
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
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? myTextColorDark
                                                        : myTextColorLight,
                                                  ),
                                                ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        // value[0].toUpperCase();
                                        lastName = value.trim();
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: Container(
                                  // width: width * .95,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myFgColorDark
                                        : myFgColorLight,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextFormField(
                                    controller: emailController,
                                    validator: (email) => email!.isEmpty
                                        ? 'Please enter your email'
                                        : !email.contains('@')
                                            ? 'Please enter a valid email'
                                            : null,
                                    focusNode: _emailFocusNode,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
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
                                                color: Theme.of(context)
                                                            .brightness ==
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
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: CMText(
                                  text:
                                      'Continuing this operation will permanently update your account information on our servers.',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: CMButton(
                                  text: 'Save',
                                  textSize: 20,
                                  onPressed: () {
                                    updateUserData(User(
                                      id: FirebaseAuth.instance.currentUser!.uid
                                          .toString(),
                                      firstName: firstName,
                                      lastName: lastName,
                                      email: email,
                                    ));
                                  },
                                  height: 60,
                                  width: double.infinity,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Future<void> updateUserData(User user) async {
    final currentUserUid = FirebaseAuth.instance.currentUser!.uid;

    if (!_formKey.currentState!.validate()) {
      return showSnackbarWithoutAction(
          context,
          Theme.of(context).brightness == Brightness.dark
              ? myPrimaryColorDark
              : myPrimaryColorLight,
          'Please fill the required fields');
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: currentUserUid)
          .get()
          .then((querySnapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        querySnapshot.docs.forEach((doc) async {
          await doc.reference.update(user.toJson());
        });
      });
    } catch (e) {
      showSnackbarWithoutAction(
          context,
          Theme.of(context).brightness == Brightness.dark
              ? myPrimaryColorDark
              : myPrimaryColorLight,
          e.toString());
    }

    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();

    // ignore: use_build_context_synchronously
    Navigator.pop(context);

    // ignore: use_build_context_synchronously
    showSnackbarWithoutAction(
        context,
        Theme.of(context).brightness == Brightness.dark
            ? myPrimaryColorDark
            : myPrimaryColorLight,
        'Updated successfully');
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
