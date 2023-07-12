import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/screens/controls/add_recipe.dart';
import 'package:mini_project/screens/controls/favourites.dart';
import 'package:mini_project/screens/controls/discover.dart';
import 'package:mini_project/screens/controls/edit_profile.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({super.key});

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User?>(
        future: getUserInfo(),
        builder: (context, userSnapshot) {
          if (userSnapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 50, 8, 8),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/boy_profile.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CMText(
                      text:
                          '${userSnapshot.data!.firstName} ${userSnapshot.data!.lastName}',
                      color: mySecondaryTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: CMText(
                      text: userSnapshot.data!.email,
                      color: mySecondaryTextColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                  const Divider(
                    color: mySecondaryTextColor,
                    thickness: 0.5,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            drawerItem(
                              'Edit Profile',
                              Icons.person,
                              () {
                                nextScreen(context, const EditProfile());
                              },
                            ),
                            drawerItem(
                              'Discover',
                              Icons.food_bank_outlined,
                              () {
                                nextScreen(context, const Discover());
                              },
                            ),
                            drawerItem(
                              'Favourites',
                              Icons.favorite,
                              () {
                                nextScreen(context, const Favourites());
                              },
                            ),
                            drawerItem(
                              'Add Recipe',
                              Icons.add_box,
                              () {
                                nextScreen(context, const AddRecipe());
                              },
                            ),
                            drawerItem(
                              'Settings',
                              Icons.settings,
                              () {
                                nextScreen(context, const Settings());
                              },
                            ),
                          ],
                        ),
                        CMButton(
                          text: 'Logout',
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pop(context);
                          },
                          color: Colors.red,
                          textSize: 25,
                          width: double.infinity,
                          height: 50,
                          elevation: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: myPrimaryColor,
                color: mySecondaryColor,
              ),
            );
          }
        },
      ),
    );
  }

  Widget drawerItem(String item, IconData icon, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Icon(
                icon,
                color: mySecondaryTextColor,
              ),
            ),
            CMText(
              text: item,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

  Future<User?> getUserInfo() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('id',
            isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString().trim())
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final documentSnapshot = querySnapshot.docs.first;
      return User.fromJson(documentSnapshot.data());
    } else {
      return null;
    }
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

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
      );
}
