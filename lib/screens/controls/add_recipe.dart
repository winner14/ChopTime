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
  String dishName = '';

  @override
  void dispose() {
    dishNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                          vertical: 10, horizontal: 8),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              CMText(
                                text: 'Name of dish',
                                fontSize: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 60,
                            child: TextField(
                              controller: dishNameController,
                              keyboardType: TextInputType.text,
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
                                hintText: 'Fried Rice with chicken',
                                suffixIcon: dishNameController.text.isEmpty
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
                          const Row(
                            children: [
                              CMText(
                                text: 'Ingredients',
                                fontSize: 20,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                child: TextField(
                                  controller: dishNameController,
                                  keyboardType: TextInputType.text,
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
                                    hintText: 'Fried Rice with chicken',
                                    suffixIcon: dishNameController.text.isEmpty
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
                            ],
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
