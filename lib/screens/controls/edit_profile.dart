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
  String firstName = '', lastName = '', email = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  Container(
                    height: height * .65,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: myBgColorLight,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: SizedBox(
                              height: 60,
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
                                  labelText: 'First name',
                                  hintText: 'John',
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.black45,
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
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.black45,
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
                            child: SizedBox(
                              height: 60,
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
                                  labelText: 'Last name',
                                  hintText: 'Smith',
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.black45,
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
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.black45,
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
                            child: SizedBox(
                              // width: width * .95,
                              height: 60,
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
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: CMText(
                              text:
                                  'Continuing this operation will permanently update your account information on our servers.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
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
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future<void> updateUserData(User user) async {
    final currentUserUid = FirebaseAuth.instance.currentUser!.uid;

    showDialog(
      context: context,
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
      showSnackbarWithoutAction(context, myPrimaryColor, e.toString());
    }

    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();

    // ignore: use_build_context_synchronously
    Navigator.pop(context);

    // ignore: use_build_context_synchronously
    showSnackbarWithoutAction(context, myPrimaryColor, 'Updated successfully');
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
