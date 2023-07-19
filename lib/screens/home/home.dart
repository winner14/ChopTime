import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/screens/add_ingredient/add_ingredient.dart';
import 'package:mini_project/screens/recipes/recipes.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:mini_project/widgets/cards/ingredient_card.dart';
import 'package:mini_project/widgets/drawer/end_drawer.dart';
import 'package:mini_project/widgets/loading_screen/loading_screen.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchController = TextEditingController();
  String search = '';
  bool isFruits = true,
      isFishAndMeat = false,
      isOthers = false,
      isSpices = false;

  final filter = [
    'Fruits',
    'Fish and Meat',
    'Others',
    'Add your own ingredient'
  ];

  List selectedIngredients = [];
  bool ingredientIsSelected = false;
  String selectedIngredient = '';
  int ingredientCount = 0;

  String? value = 'Fruits';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: myPrimaryColor,
        width: width * .6,
        child: const EndDrawer(),
      ),
      body: FutureBuilder<User?>(
        future: getUserInfo(),
        builder: (context, userSnapshot) {
          if (userSnapshot.hasData) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: myPrimaryColor,
                image: DecorationImage(
                    image: AssetImage('assets/images/topBg.png'),
                    repeat: ImageRepeat.repeat,
                    opacity: .35),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const CMText(
                                  text: 'Hello, ',
                                  color: myBgColorLight,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                                CMText(
                                  text: userSnapshot
                                      .data!.firstName, // add function later
                                  color: myBgColorLight,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            const CMText(
                              text: 'Ready for a Meal?',
                              color: myBgColorLight,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: Builder(
                            builder: (BuildContext context) {
                              return const SizedBox(
                                height: 60,
                                width: 60,
                                child: CircleAvatar(
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/boy_profile.png'),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: height * .8,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: myBgColorLight,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: SizedBox(
                        height: .8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  // child: Padding(
                                  //   padding:
                                  //       const EdgeInsets.fromLTRB(5, 5, 0, 5),
                                  //   child: CMButton(
                                  //     text: 'Add and Ingredient',
                                  //     textColor: myBgColorDark,
                                  //     color: myBgColorLight,
                                  //     borderColor: myBgColorDark,
                                  //     onPressed: () {
                                  //       //add funtion later
                                  //     },
                                  //   ),
                                  // ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 5, 0, 5),
                                    child: SizedBox(
                                      height: 55,
                                      width: width * .6,
                                      child: TextField(
                                        controller: searchController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.search,
                                        decoration: InputDecoration(
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: mySecondaryColor,
                                              width: .5,
                                            ),
                                            borderRadius:
                                                BorderRadius.horizontal(
                                              right: Radius.circular(15),
                                              left: Radius.circular(15),
                                            ),
                                          ),
                                          border: const OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.horizontal(
                                              right: Radius.circular(15),
                                              left: Radius.circular(15),
                                            ),
                                            borderSide: BorderSide(
                                                color: mySecondaryColor,
                                                width: .5),
                                          ),
                                          iconColor: mySecondaryColor,
                                          // labelText: label,
                                          hintText: 'Search to add ingredients',
                                          // prefixIcon: icon,
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              // searchController.clear();
                                            },
                                            icon: const Icon(
                                              Icons.search_rounded,
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            search = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: PopupMenuButton<String>(
                                    icon: const Center(
                                      child: Icon(
                                        Icons.filter_list_rounded,
                                        color: myPrimaryColor,
                                        size: 40,
                                      ),
                                    ),
                                    itemBuilder: (BuildContext context) {
                                      return filter.map((String item) {
                                        return PopupMenuItem<String>(
                                          value: item,
                                          child: Text(item),
                                        );
                                      }).toList();
                                    },
                                    onSelected: (String? value) {
                                      setState(() {
                                        this.value = value;
                                        if (value == 'Fruits') {
                                          isFruits = true;
                                          isFishAndMeat = false;
                                          isOthers = false;
                                        } else if (value == 'Fish and Meat') {
                                          isFruits = false;
                                          isFishAndMeat = true;
                                          isOthers = false;
                                        } else if (value == 'Others') {
                                          isFruits = false;
                                          isFishAndMeat = false;
                                          isOthers = true;
                                        } else if (value ==
                                            'Add your own ingredient') {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) =>
                                                const AddIngredient(),
                                          );
                                        }
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: StreamBuilder<List<Ingredients>>(
                                stream: getIngredients(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final ingredients = snapshot.data!;
                                    print(selectedIngredients);
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: GridView.count(
                                        padding: const EdgeInsets.only(top: 0),
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5,
                                        childAspectRatio: 1,
                                        children: buildIngredients(ingredients),
                                      ),
                                    );
                                  } else {
                                    print(snapshot.error);
                                    return const Loading();
                                  }
                                },
                              ),
                            ),
                            Container(
                              height: height * .18,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: myPrimaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 18),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Center(
                                            child: CMText(
                                              text: 'Selected Ingredients',
                                              color: myPrimaryTextColor,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF045007),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Center(
                                              child: CMText(
                                            text: '$ingredientCount',
                                            color: myPrimaryTextColor,
                                            fontSize: 18,
                                          )),
                                        ),
                                        CMButton(
                                          text: 'Clear',
                                          textSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF045007),
                                          borderRadius: 10,
                                          width: 80,
                                          height: 30,
                                          onPressed: () {
                                            setState(() {
                                              selectedIngredients.clear();
                                              ingredientCount = 0;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                    CMButton(
                                      text: "Let's Cook!",
                                      textSize: 20,
                                      fontWeight: FontWeight.w500,
                                      width: width * .95,
                                      onPressed: () {
                                        if (ingredientCount == 0) {
                                          const SnackBar(
                                            backgroundColor: myPrimaryColor,
                                            content: CMText(
                                              text:
                                                  'Please select at least one ingredient',
                                              color: Colors.white,
                                            ),
                                            duration:
                                                Duration(milliseconds: 200),
                                          );
                                          showSnackbarWithoutAction(
                                            context,
                                            myPrimaryColor,
                                            'Please select at least one ingredient',
                                          );
                                          return;
                                        } else {
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) => Recipes(
                                              selectedIngredients:
                                                  selectedIngredients,
                                            ),
                                          );
                                        }
                                      },
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Loading();
          }
        },
      ),
    );
  }

  List<Widget> buildIngredients(List<Ingredients> ingredients) {
    return ingredients.map((ingredient) {
      final isSelected = selectedIngredients.contains(ingredient.name);

      return GestureDetector(
        onTap: () {
          setState(() {
            if (isSelected) {
              selectedIngredients.remove(ingredient.name);
              if (ingredientCount > 0) {
                ingredientCount--;
              }
            } else {
              selectedIngredients.add(ingredient.name);
              ingredientCount++;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 2),
          child: IngredientCard(
            ingredient: ingredient.name,
            isSelected: isSelected,
          ),
        ),
      );
    }).toList();
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

  Stream<List<Ingredients>> getIngredients() {
    if (isFruits) {
      return FirebaseFirestore.instance
          .collection('ingredients')
          .where('category', isEqualTo: 'Fruits and Vegetables')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Ingredients.fromJson(doc.data()))
              .toList());
    } else if (isFishAndMeat) {
      return FirebaseFirestore.instance
          .collection('ingredients')
          .where('category', isEqualTo: 'Fish and Meat')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Ingredients.fromJson(doc.data()))
              .toList());
    } else if (isOthers) {
      return FirebaseFirestore.instance
          .collection('ingredients')
          .where('category', isEqualTo: 'Spices')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Ingredients.fromJson(doc.data()))
              .toList());
    } else if (isOthers) {
      return FirebaseFirestore.instance
          .collection('ingredients')
          .where('category', isEqualTo: 'Others')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Ingredients.fromJson(doc.data()))
              .toList());
    } else {
      return FirebaseFirestore.instance
          .collection('ingredients')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Ingredients.fromJson(doc.data()))
              .toList());
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

class Ingredients {
  String id;
  final String name;
  final String category;

  Ingredients({
    this.id = '',
    required this.name,
    required this.category,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
      };

  static Ingredients fromJson(Map<String, dynamic> json) => Ingredients(
        id: json['id'],
        name: json['name'],
        category: json['category'],
      );
}
