import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/text/cm_text.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final recipeNameController = TextEditingController();
  final ingredientController = TextEditingController();
  final directionController = TextEditingController();
  final durationController = TextEditingController();
  String steps = '', ingredient = '', recipeName = '';
  int duration = 0;

  List<String> ingredients = [];
  List<String> directions = [];

  @override
  void dispose() {
    recipeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const CMText(
            text: 'Add Recipe',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          )),
      extendBodyBehindAppBar: true,
      body: Container(
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
              children: [
                Container(
                  height: height * .85,
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  // const Padding(
                                  //   padding:
                                  //       EdgeInsets.symmetric(vertical: 8.0),
                                  //   child: Row(
                                  //     children: [
                                  //       CMText(
                                  //         text: 'Name of dish',
                                  //         fontSize: 20,
                                  //         color: myTextColorLight,
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: Container(
                                      height: 60,
                                      width: width * .95,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? myFgColorDark
                                            : myFgColorLight,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      child: TextField(
                                        controller: recipeNameController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          labelStyle: const TextStyle(
                                              color: Color(0xA0000000),
                                              fontSize: 18),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: mySecondaryColor,
                                              width: 2,
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
                                            // borderSide: BorderSide(color: borderColor, width: borderWidth),
                                          ),
                                          iconColor: mySecondaryColor,
                                          hintText: 'Name of Dish',
                                          suffixIcon:
                                              recipeNameController.text.isEmpty
                                                  ? const SizedBox(
                                                      width: 0,
                                                    )
                                                  : IconButton(
                                                      onPressed: () {
                                                        recipeName = '';
                                                        recipeNameController
                                                            .clear();
                                                      },
                                                      icon: const Icon(
                                                        Icons.close,
                                                        color: Colors.black45,
                                                      ),
                                                    ),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            recipeName = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  // const Padding(
                                  //   padding:
                                  //       EdgeInsets.symmetric(vertical: 8.0),
                                  //   child: Row(
                                  //     children: [
                                  //       CMText(
                                  //         text: 'Ingredients',
                                  //         fontSize: 20,
                                  //         color: myTextColorLight,
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: Container(
                                            height: 60,
                                            width: width * .4,
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
                                            child: TextField(
                                              controller: ingredientController,
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: InputDecoration(
                                                labelStyle: const TextStyle(
                                                    color: Color(0xA0000000),
                                                    fontSize: 18),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: mySecondaryColor,
                                                    width: 2,
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
                                                  // borderSide: BorderSide(color: borderColor, width: borderWidth),
                                                ),
                                                iconColor: mySecondaryColor,
                                                hintText: 'Ingredients',
                                                suffixIcon: ingredientController
                                                        .text.isEmpty
                                                    ? const SizedBox(
                                                        width: 0,
                                                      )
                                                    : IconButton(
                                                        onPressed: () {
                                                          ingredient = '';
                                                          ingredientController
                                                              .clear();
                                                        },
                                                        icon: const Icon(
                                                          Icons.close,
                                                          color: Colors.black45,
                                                        ),
                                                      ),
                                              ),
                                              onChanged: (value) {
                                                setState(() {
                                                  ingredient = value;
                                                });
                                              },
                                              onSubmitted: (value) {
                                                setState(() {
                                                  ingredients.add(value);
                                                  ingredientController.clear();
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 60,
                                          width: width * .53,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: ingredients.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  child: Chip(
                                                    label: CMText(
                                                        text:
                                                            ingredients[index]),
                                                    onDeleted: () {
                                                      setState(() {
                                                        ingredients
                                                            .removeAt(index);
                                                      });
                                                    },
                                                  ),
                                                );
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: [
                                      const Row(
                                        children: [
                                          CMText(
                                            text: 'Directions',
                                            fontSize: 20,
                                            color: myTextColorLight,
                                          ),
                                        ],
                                      ),
                                      directions.isNotEmpty
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: SizedBox(
                                                height: 180,
                                                width: width * .95,
                                                child: ListView.builder(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0),
                                                    itemCount:
                                                        directions.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 1.5),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .dark
                                                                ? myFgColorDark
                                                                : myFgColorLight,
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  8),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                CMText(
                                                                  text:
                                                                      "${index + 1}. ${directions[index]}",
                                                                  fontSize: 18,
                                                                  color:
                                                                      myTextColorLight,
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      directions
                                                                          .removeAt(
                                                                              index);
                                                                    });
                                                                  },
                                                                  child: const Icon(
                                                                      Icons
                                                                          .close,
                                                                      color: Colors
                                                                          .black45,
                                                                      size: 18),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            )
                                          : const SizedBox(height: 10),
                                    ]),
                                    Container(
                                      height: 60,
                                      width: width * .95,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? myFgColorDark
                                            : myFgColorLight,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      child: TextField(
                                        controller: directionController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          labelStyle: const TextStyle(
                                              color: Color(0xA0000000),
                                              fontSize: 18),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: mySecondaryColor,
                                              width: 2,
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
                                            // borderSide: BorderSide(color: borderColor, width: borderWidth),
                                          ),
                                          iconColor: mySecondaryColor,
                                          hintText:
                                              'Add directions step by step',
                                          suffixIcon: directionController
                                                  .text.isEmpty
                                              ? const SizedBox(
                                                  width: 0,
                                                )
                                              : IconButton(
                                                  onPressed: () {
                                                    steps = '';
                                                    directionController.clear();
                                                  },
                                                  icon: const Icon(
                                                    Icons.close,
                                                    color: Colors.black45,
                                                  ),
                                                ),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            steps = value;
                                          });
                                        },
                                        onSubmitted: (value) {
                                          setState(() {
                                            directions.add(value);
                                            directionController.clear();
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // const Padding(
                                            //   padding:
                                            //       EdgeInsets.only(bottom: 8.0),
                                            //   child: CMText(
                                            //     text: "Estimated cooking time",
                                            //     fontSize: 18,
                                            //     color: myTextColorLight,
                                            //   ),
                                            // ),
                                            Container(
                                              height: 60,
                                              width: width * .4,
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
                                              child: TextField(
                                                controller: durationController,
                                                keyboardType:
                                                    TextInputType.number,
                                                textInputAction:
                                                    TextInputAction.done,
                                                decoration: InputDecoration(
                                                  labelStyle: const TextStyle(
                                                      color: Color(0xA0000000),
                                                      fontSize: 18),
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: mySecondaryColor,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.horizontal(
                                                      right:
                                                          Radius.circular(15),
                                                      left: Radius.circular(15),
                                                    ),
                                                  ),
                                                  border:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.horizontal(
                                                      right:
                                                          Radius.circular(15),
                                                      left: Radius.circular(15),
                                                    ),
                                                    // borderSide: BorderSide(color: borderColor, width: borderWidth),
                                                  ),
                                                  iconColor: mySecondaryColor,
                                                  hintText: 'Cooking time',
                                                  suffixIcon: durationController
                                                          .text.isEmpty
                                                      ? const SizedBox(
                                                          width: 0,
                                                        )
                                                      : IconButton(
                                                          onPressed: () {
                                                            duration = 0;
                                                            durationController
                                                                .clear();
                                                          },
                                                          icon: const Icon(
                                                            Icons.close,
                                                            color:
                                                                Colors.black45,
                                                          ),
                                                        ),
                                                ),
                                                onChanged: (value) {
                                                  setState(() {
                                                    duration = int.parse(value);
                                                  });
                                                },
                                                onSubmitted: (value) {
                                                  setState(() {
                                                    directions.add(value);
                                                    directionController.clear();
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CMButton(
                                            text: 'Submit',
                                            onPressed: () {
                                              final recipes = Recipes(
                                                  recipeName: recipeName,
                                                  ingredients: ingredients,
                                                  steps: directions,
                                                  duration: duration,
                                                  likes: 0);
                                              addRecipe(recipes);
                                            },
                                            width: 150,
                                          ),
                                        ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future addRecipe(Recipes recipes) async {
    try {
      final docUser = FirebaseFirestore.instance.collection('recipes').doc();
      final json = recipes.toJson();
      await docUser.set(json);
    } catch (e) {
      showSnackbarWithoutAction(
          context,
          Theme.of(context).brightness == Brightness.dark
              ? myPrimaryColorDark
              : myPrimaryColorLight,
          e);
    }
  }
}

class Recipes {
  String id;
  final String recipeName;
  final List ingredients;
  final List steps;
  final int duration;
  bool isApproved;
  String by;
  final int likes;

  Recipes({
    this.id = '',
    required this.recipeName,
    required this.ingredients,
    required this.steps,
    required this.duration,
    this.isApproved = false,
    this.by = 'Community',
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'recipeName': recipeName,
        'ingredients': ingredients,
        'Steps': steps,
        'duration': duration,
        'isApproved': isApproved,
        'by': by,
        'likes': likes,
      };

  static Recipes fromJson(Map<String, dynamic> json) => Recipes(
        id: json['id'],
        recipeName: json['recipeName'],
        ingredients: json['ingredients'],
        steps: json['Steps'],
        duration: json['duration'],
        isApproved: json['isApproved'],
        by: json['by'],
        likes: json['likes'],
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
