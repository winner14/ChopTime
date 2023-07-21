import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class AddIngredient extends StatefulWidget {
  const AddIngredient({super.key});

  @override
  State<AddIngredient> createState() => _AddIngredientState();
}

class _AddIngredientState extends State<AddIngredient> {
  final ingredientNameController = TextEditingController();
  String ingredientName = '';

  final genders = [
    'Fruits and Vegetables',
    'Fish and Meat',
    'Spices',
    'Othes',
  ];

  String? value = 'Fruits and Vegetables';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      excludeFromSemantics: true,
      child: DraggableScrollableSheet(
        initialChildSize: .5,
        maxChildSize: .8,
        minChildSize: .45,
        builder: (_, controller) => Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            color: myBgColorLight,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 5,
                  decoration: const BoxDecoration(
                      color: mySecondaryColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20),
                        right: Radius.circular(20),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: CMText(
                    text: 'Name of ingredient:',
                    fontSize: 22,
                    color: myTextColorLight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    height: 60,
                    child: TextField(
                      controller: ingredientNameController,
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
                        labelText: 'Add ingredient name',
                        // prefixIcon: const Icon(
                        //   Icons.,
                        //   color: Colors.black45,
                        // ),
                        suffixIcon: ingredientNameController.text.isEmpty
                            ? const SizedBox(
                                width: 0,
                              )
                            : IconButton(
                                onPressed: () {
                                  ingredientName = '';
                                  ingredientNameController.clear();
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
                          ingredientName = value.trim();
                        });
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: CMText(
                    text: 'Category of ingredient',
                    fontSize: 22,
                    color: myTextColorLight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: myBgColorLight,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: mySecondaryColor,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          elevation: 10,
                          focusColor:
                              Theme.of(context).brightness == Brightness.dark
                                  ? myPrimaryColorDark
                                  : myPrimaryColorLight,
                          dropdownColor: const Color(0xB14CAF4F),
                          value: value,
                          items: genders.map(buildMenuItem).toList(),
                          onChanged: ((value) =>
                              setState(() => this.value = value)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CMButton(
                        text: 'Submit',
                        width: double.infinity,
                        onPressed: () {
                          final ingredients = Ingredients(
                            name: ingredientName,
                            category: value!,
                          );
                          addIngredient(ingredients);
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  Future addIngredient(Ingredients ingredients) async {
    // final formIsValid = _formKey.currentState!.validate();
    // if (!formIsValid) {
    //   return;
    // }

    final docIngredient =
        FirebaseFirestore.instance.collection('ingredients').doc();
    // user.id = FirebaseAuth.instance.currentUser!.uid;

    final json = ingredients.toJson();
    await docIngredient.set(json);
  }
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
