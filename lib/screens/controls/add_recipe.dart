import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/text/cm_text.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';

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
  double directionsBoxHeight = 0;
  final _formKey = GlobalKey<FormState>();

  List<String> ingredients = [];
  List<String> directions = [];
  Future<List<String>> oldIngredients = FirebaseFirestore.instance
      .collection('ingredients')
      .get()
      .then((value) => value.docs.map((e) => e['name'].toString()).toList());

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
                              Form(
                                key: _formKey,
                                child: Column(
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
                                            suffixIcon: recipeNameController
                                                    .text.isEmpty
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
                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       vertical: 8.0),
                                    //   child: Row(
                                    //     children: [
                                    //       CMText(
                                    //         text: 'Ingredients',
                                    //         fontSize: 20,
                                    //         color: Theme.of(context).brightness ==
                                    //                 Brightness.dark
                                    //             ? myTextColorDark
                                    //             : myTextColorDark,
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 4.0),
                                            child: Container(
                                              height: 60,
                                              // width: width * .4,
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
                                                controller:
                                                    ingredientController,
                                                keyboardType:
                                                    TextInputType.text,
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
                                                  hintText: 'Ingredients',
                                                  suffixIcon:
                                                      ingredientController
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
                                                                color: Colors
                                                                    .black45,
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

                                                    ingredientController
                                                        .clear();
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            // width: width * .53,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: ingredients.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 2),
                                                    child: Chip(
                                                      label: CMText(
                                                          text: ingredients[
                                                              index]),
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
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        // Row(
                                        //   children: [
                                        //     CMText(
                                        //       text: 'Directions',
                                        //       fontSize: 20,
                                        //       color:
                                        //           Theme.of(context).brightness ==
                                        //                   Brightness.dark
                                        //               ? myTextColorDark
                                        //               : myTextColorDark,
                                        //     ),
                                        //   ],
                                        // ),
                                        Container(
                                          height: 60,
                                          width: width * .95,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? myFgColorDark
                                                    : myFgColorLight,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                          ),
                                          child: TextField(
                                            controller: directionController,
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
                                                        directionController
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
                                                steps = value;
                                              });
                                            },
                                            onSubmitted: (value) {
                                              setState(() {
                                                directions.add(value);
                                                directionsBoxHeight += 35;
                                                directionController.clear();
                                              });
                                            },
                                          ),
                                        ),
                                        // directions.isNotEmpty
                                        //     ?
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Expanded(
                                            child: Container(
                                              height: 40 + directionsBoxHeight,
                                              width: width * .95,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? myFgColorDark
                                                    : myFgColorLight,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: ListView.builder(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0),
                                                  itemCount: directions.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 1.5),
                                                      child: Container(
                                                        height: 35,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? myBgColorDark
                                                              : myBgColorLight,
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(8),
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
                                                                color: Theme.of(context)
                                                                            .brightness ==
                                                                        Brightness
                                                                            .dark
                                                                    ? myTextColorDark
                                                                    : myTextColorLight,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    directions
                                                                        .removeAt(
                                                                            index);
                                                                    directionsBoxHeight -=
                                                                        35;
                                                                  });
                                                                },
                                                                child: Icon(
                                                                    Icons.close,
                                                                    color: Theme.of(context).brightness ==
                                                                            Brightness.dark
                                                                        ? myTextColorDark
                                                                        : myTextColorLight,
                                                                    size: 18),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ),
                                        )
                                        // : const SizedBox(height: 10),
                                      ],
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
                                              // width: width * .4,
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
                                                  // setState(() {
                                                  //   directions.add(value);
                                                  //   directionController.clear();
                                                  // });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: CMButton(
                                        text: 'Add a picture',
                                        width: width * .93,
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? myFgColorDark
                                            : myFgColorLight,
                                        borderColor: mySecondaryColor,
                                        hasIcon: true,
                                        icon: Icon(Icons.add_a_photo_outlined,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? myTextColorDark
                                                    : myTextColorLight),
                                        onPressed: () {
                                          // selectPhoto(ImageSource.gallery);
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) =>
                                                _selectPhoto(),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: CMButton(
                                        text: 'Submit',
                                        onPressed: () {
                                          final recipes = Recipes(
                                              recipeName: recipeName,
                                              ingredients: ingredients,
                                              steps: directions,
                                              duration: duration,
                                              likes: 0);
                                          addRecipe(recipes);

                                          oldIngredients.then(
                                            (value) {
                                              bool ingredientInDatabase = false;
                                              for (int i = 0;
                                                  i < value.length;
                                                  i++) {
                                                for (int i = 0;
                                                    i < ingredients.length;
                                                    i++) {
                                                  if (value[i].toLowerCase() ==
                                                      ingredients[i]
                                                          .toLowerCase()) {
                                                    ingredientInDatabase = true;
                                                  }
                                                }
                                                if (ingredientInDatabase ==
                                                    false) {
                                                  final ingredient =
                                                      Ingredients(
                                                    name: ingredients[i],
                                                  );
                                                  addNewIngredient(ingredient);
                                                }
                                              }
                                            },
                                          );
                                          // oldIngredients.then((value) => {
                                          //       value.sort(),
                                          //       value.forEach((element) {
                                          //         print(element);
                                          //       })
                                          //     });
                                        },
                                        width: width * .93,
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

  Widget _selectPhoto() {
    return DraggableScrollableSheet(
      initialChildSize: .22,
      maxChildSize: .3,
      minChildSize: .2,
      builder: (_, controller) => Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? myBgColorDark
              : myBgColorLight,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CMButton(
                text: 'Select from gallery',
                width: double.infinity,
                onPressed: () {
                  selectPhoto(ImageSource.gallery);
                },
              ),
              CMButton(
                text: 'Take a photo',
                width: double.infinity,
                onPressed: () {
                  selectPhoto(ImageSource.camera);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  File? image;

  Future selectPhoto(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final temporalImage = File(image.path);
      setState(() {
        this.image = temporalImage;
      });
    } catch (e) {
      showSnackbarWithoutAction(
          context,
          Theme.of(context).brightness == Brightness.dark
              ? myPrimaryColorDark
              : myPrimaryColorLight,
          e.toString());
    }
  }

  // Future selectPhoto(ImageSource source) async {
  //   if (source == ImageSource.camera) {
  //     var cameraPermissionStatus = await Permission.camera.request();
  //     if (cameraPermissionStatus.isDenied) {
  //       // Handle camera permission denied
  //       return;
  //     }
  //   } else if (source == ImageSource.gallery) {
  //     var galleryPermissionStatus = await Permission.photos.request();
  //     if (galleryPermissionStatus.isDenied) {
  //       // Handle photo library permission denied
  //       return;
  //     }
  //   }

  //   try {
  //     final pickedFile = await ImagePicker().pickImage(source: source);
  //     if (pickedFile == null) return;

  //     File? img = File(pickedFile.path);
  //     setState(() {
  //       image = img;
  //     });
  //   } catch (e) {
  //     showSnackbarWithoutAction(
  //         context,
  //         Theme.of(context).brightness == Brightness.dark
  //             ? myPrimaryColorDark
  //             : myPrimaryColorLight,
  //         e.toString());
  //   }
  // }

  Future addRecipe(Recipes recipes) async {
    final formIsValid = _formKey.currentState!.validate();
    if (!formIsValid) {
      return showSnackbarWithoutAction(
          context, Colors.red, 'Please fill in all fields correctly.');
    }

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

  Future addNewIngredient(Ingredients ingredients) async {
    final docIngredient =
        FirebaseFirestore.instance.collection('ingredients').doc();

    final json = ingredients.toJson();
    await docIngredient.set(json);
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
  final bool isApproved;

  Ingredients({
    this.id = '',
    this.isApproved = false,
    required this.name,
    this.category = '',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'isApproved': isApproved,
      };

  static Ingredients fromJson(Map<String, dynamic> json) => Ingredients(
        id: json['id'],
        name: json['name'],
        category: json['category'],
        isApproved: json['isApproved'],
      );
}
