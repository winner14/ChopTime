import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/add_ingredient/add_ingredient.dart';
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
  final FocusNode searchFocusNode = FocusNode();
  String search = '';
  final _formKey = GlobalKey<FormState>();

  bool isFruits = true,
      isFishAndMeat = false,
      isOthers = false,
      isSpices = false;

  final filter = [
    'Fruits and Vegetables',
    'Fish and Meat',
    'Spices',
    'Others',
    'All Ingredients',
    'Add your own ingredient'
  ];

  List selectedIngredients = [];
  bool ingredientIsSelected = false;
  String selectedIngredient = '';
  int ingredientCount = 0;

  String? value = 'Fruits and Vegetables';

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? myBgColorDark
            : myBgColorLight,
        width: width * .6,
        child: const EndDrawer(),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          searchFocusNode.unfocus();
        },
        child: FutureBuilder<User?>(
          future: getUserInfo(),
          builder: (context, userSnapshot) {
            if (userSnapshot.hasData) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? myBgColorDark
                      : myPrimaryColorLight,
                  image: DecorationImage(
                    image: Theme.of(context).brightness == Brightness.dark
                        ? const AssetImage('assets/images/topBgDark.png')
                        : const AssetImage('assets/images/topBg.png'),
                    repeat: ImageRepeat.repeat,
                    opacity: Theme.of(context).brightness == Brightness.dark
                        ? .15
                        : .35,
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 5, 8, 8),
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
                                      text: userSnapshot.data!.firstName,
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? myPrimaryColorLight
                                          : myTextColorDark,
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
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? myBgColorLight
                                    : myBgColorDark,
                            borderRadius: const BorderRadius.only(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            2, 5, 0, 5),
                                        child: Focus(
                                          key: _formKey,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? myFgColorDark
                                                  : myFgColorLight,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(15)),
                                            ),
                                            height: 55,
                                            width: width * .6,
                                            child: TextField(
                                              controller: searchController,
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.search,
                                              focusNode: searchFocusNode,
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
                                                border:
                                                    const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.horizontal(
                                                    right: Radius.circular(15),
                                                    left: Radius.circular(15),
                                                  ),
                                                  borderSide: BorderSide(
                                                      color: mySecondaryColor,
                                                      width: .1),
                                                ),
                                                iconColor: mySecondaryColor,
                                                // labelText: label,
                                                hintText:
                                                    'Search to add ingredients',
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
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? myFgColorDark
                                              : myFgColorLight,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: PopupMenuButton<String>(
                                          icon: Center(
                                            child: Icon(
                                              Icons.filter_list_rounded,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? myTextColorDark
                                                  : myTextColorLight,
                                              size: 38,
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
                                              if (value ==
                                                  'Fruits and Vegetables') {
                                                setState(() {
                                                  isFruits = true;
                                                  isFishAndMeat = false;
                                                  isSpices = false;
                                                  isOthers = false;
                                                });
                                              } else if (value ==
                                                  'Fish and Meat') {
                                                setState(() {
                                                  isFruits = false;
                                                  isSpices = false;
                                                  isFishAndMeat = true;
                                                  isOthers = false;
                                                });
                                              } else if (value == 'Others') {
                                                setState(() {
                                                  isFruits = false;
                                                  isFishAndMeat = false;
                                                  isSpices = false;
                                                  isOthers = true;
                                                });
                                              } else if (value == 'Spices') {
                                                setState(() {
                                                  isFruits = false;
                                                  isFishAndMeat = false;
                                                  isSpices = true;
                                                  isOthers = false;
                                                });
                                              } else if (value ==
                                                  'All Ingredients') {
                                                setState(() {
                                                  isFruits = false;
                                                  isFishAndMeat = false;
                                                  isSpices = false;
                                                  isOthers = false;
                                                });
                                              } else if (value ==
                                                  'Add your own ingredient') {
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) =>
                                                      const AddIngredient(),
                                                );
                                              }
                                            });
                                          },
                                        ),
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
                                        // print(selectedIngredients);
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          child: GridView.count(
                                            padding:
                                                const EdgeInsets.only(top: 0),
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 2,
                                            mainAxisSpacing: 2,
                                            childAspectRatio: 1,
                                            children:
                                                buildIngredients(ingredients),
                                          ),
                                        );
                                      } else {
                                        // print(snapshot.error);
                                        return const Loading();
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  // height: height * .18,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myPrimaryColorDark
                                        : myPrimaryColorLight,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 18),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5),
                                                child: Center(
                                                  child: CMText(
                                                    text:
                                                        'Selected Ingredients',
                                                    color: myTextColorDark,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? myBgColorDark
                                                      : const Color(0xFF045007),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Center(
                                                    child: CMText(
                                                  text: ingredientCount < 20
                                                      ? '$ingredientCount'
                                                      : '20+',
                                                  color: myTextColorDark,
                                                  fontSize: 18,
                                                )),
                                              ),
                                              CMButton(
                                                text: 'Clear',
                                                textSize: 18,
                                                fontWeight: FontWeight.w500,
                                                // color: const Color(0xFF045007),
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? myBgColorDark
                                                    : const Color(0xFF045007),
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
                                        ),
                                        CMButton(
                                          text: "Let's Cook!",
                                          textSize: 20,
                                          fontWeight: FontWeight.w500,
                                          width: width * .95,
                                          onPressed: () {
                                            if (ingredientCount == 0) {
                                              SnackBar(
                                                backgroundColor:
                                                    Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? myPrimaryColorDark
                                                        : myPrimaryColorLight,
                                                content: const CMText(
                                                  text:
                                                      'Please select at least one ingredient',
                                                  color: Colors.white,
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 200),
                                              );
                                              showSnackbarWithoutAction(
                                                context,
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? myPrimaryColorDark
                                                    : myPrimaryColorLight,
                                                'Please select at least one ingredient',
                                              );
                                              return;
                                            } else {
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
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
                ),
              );
            } else {
              return const Loading();
            }
          },
        ),
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
    } else if (isSpices) {
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
