import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

const myPrimaryColorLight = Color(0xFF4CAF50);
const myPrimaryColorDark = Color.fromARGB(255, 0, 0, 0);
const mySecondaryColor = Color(0xFFCFB53B);
const myTextColorDark = Color(0xFFF7FDF7);
const myTextColorLight = Color(0xFF201F1F);
const myPrimaryDarkColor = Color(0xFF4CAF50);
const myBgColorDark = Color(0xFF201F1F);
const myFgColorDark = Colors.black;
const myBgColorLight = Color(0xFFDFE6DF);
const myFgColorLight = Colors.white;

//next screen
void nextScreen(context, screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

//snackbar
void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: CMText(
        text: message,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Okay',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}

//snackbar without action
void showSnackbarWithoutAction(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: CMText(
        text: message,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 5),
    ),
  );
}

final currentUser = FirebaseAuth.instance.currentUser;

// Future<User?> getUserInfo() async {
//  final User? user = FirebaseAuth.instance.currentUser;
// final String userId = user?.uid ?? '';

// final CollectionReference usersCollection =
//     FirebaseFirestore.instance.collection('users');
// final DocumentSnapshot userSnapshot = await usersCollection.doc(userId).get();

// if (userSnapshot.exists) {
//   final Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
//   // Access specific fields from the userData map
//   final String firstName = userData['firstName'] ?? '';
//   final String lastName = userData['lastName'] ?? '';
//   final String email = userData['email'] ?? '';
//   // Use the retrieved data as needed
// }

// }