import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final dishNameController = TextEditingController();
  final ingredientController = TextEditingController();
  final directionController = TextEditingController();
  String direction = '', ingredient = '', dishName = '';

  List<String> ingredients = [];
  List<String> directions = [];

  @override
  void dispose() {
    dishNameController.dispose();
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
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Container(
                height: height * .85,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: myBgColorLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
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
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    CMText(
                                      text: 'Name of dish',
                                      fontSize: 20,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: SizedBox(
                                  height: 60,
                                  width: width * .95,
                                  child: TextField(
                                    controller: dishNameController,
                                    keyboardType: TextInputType.text,
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
                                      iconColor: mySecondaryColor,
                                      hintText: 'Fried Rice with chicken',
                                      suffixIcon:
                                          dishNameController.text.isEmpty
                                              ? const SizedBox(
                                                  width: 0,
                                                )
                                              : IconButton(
                                                  onPressed: () {
                                                    dishName = '';
                                                    dishNameController.clear();
                                                  },
                                                  icon: const Icon(
                                                    Icons.close,
                                                    color: Colors.black45,
                                                  ),
                                                ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        dishName = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    CMText(
                                      text: 'Ingredients',
                                      fontSize: 20,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 4.0),
                                      child: SizedBox(
                                        height: 60,
                                        width: width * .4,
                                        child: TextField(
                                          controller: ingredientController,
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
                                            hintText: 'Input ingredient',
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
                                            return Chip(
                                              label: CMText(
                                                  text: ingredients[index]),
                                              onDeleted: () {
                                                //remove item from list
                                                setState(() {
                                                  ingredients.removeAt(index);
                                                });
                                              },
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
                                  const Row(
                                    children: [
                                      CMText(
                                        text: 'Directions',
                                        fontSize: 20,
                                      ),
                                    ],
                                  ),
                                  directions.isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: SizedBox(
                                            height: 230,
                                            width: width * .95,
                                            child: ListView.builder(
                                                padding: const EdgeInsets.only(
                                                    top: 0),
                                                itemCount: directions.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 1.5),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[300],
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
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  directions
                                                                      .removeAt(
                                                                          index);
                                                                });
                                                              },
                                                              child: const Icon(
                                                                  Icons.close,
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
                                SizedBox(
                                  height: 60,
                                  width: width * .95,
                                  child: TextField(
                                    controller: directionController,
                                    keyboardType: TextInputType.text,
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
                                      iconColor: mySecondaryColor,
                                      hintText: 'Add directions step by step',
                                      suffixIcon:
                                          directionController.text.isEmpty
                                              ? const SizedBox(
                                                  width: 0,
                                                )
                                              : IconButton(
                                                  onPressed: () {
                                                    direction = '';
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
                                        direction = value;
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
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
