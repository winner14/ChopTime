import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/screens/controls/add_recipe.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:mini_project/widgets/cards/recipe_card.dart';
import 'package:mini_project/widgets/loading_screen/loading_screen.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class Recipes extends StatefulWidget {
  final List selectedIngredients;
  const Recipes({Key? key, required this.selectedIngredients})
      : super(key: key);

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      excludeFromSemantics: true,
      // onTap: () => Navigator.of(context).pop(),
      child: DraggableScrollableSheet(
        initialChildSize: .83,
        maxChildSize: .95,
        minChildSize: .7,
        builder: (_, controller) => Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? myBgColorDark
                : myBgColorLight,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    padding: EdgeInsets.only(top: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CMText(
                          text: 'Recipes that match your ingredients',
                          color: myTextColorLight,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<List<Recipe>>(
                      stream: getMatchedRecipes(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final recipes = snapshot.data!;
                          // print(widget.selectedIngredients);
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * .8,
                            width: double.infinity,
                            child: ListView(
                              padding: const EdgeInsets.only(top: 0),
                              children: recipes.map(buildRecipes).toList(),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: CMText(
                              text: 'Something went wrong',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        } else if (snapshot.hasData == false) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * .8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CMText(
                                  text:
                                      'No recipes found for your selected ingredients. \nTry adding more ingredients or change your selected ingredients.',
                                  textAlign: TextAlign.center,
                                  fontSize: 18,
                                  color: myTextColorLight,
                                  fontWeight: FontWeight.w500,
                                ),
                                CMButton(
                                    text: 'Submit a recipe',
                                    width: double.infinity,
                                    onPressed: () {
                                      nextScreen(context, const AddRecipe());
                                    })
                              ],
                            ),
                          );
                        } else {
                          return const Center(
                            child: Loading(),
                          );
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Stream<List<Recipe>> getMatchedRecipes() {
    return FirebaseFirestore.instance
        .collection('recipes')
        .where('ingredients', arrayContainsAny: widget.selectedIngredients)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList());
  }

  Widget buildRecipes(Recipe recipe) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 2),
      child: RecipeCard(
        recipeName: recipe.recipeName,
        duration: recipe.duration,
        likes: recipe.likes,
        by: recipe.by,
        imageUrl: '',
      ),
    );
  }
}

class Recipe {
  String id;
  final String recipeName;
  final List ingredients;
  final List steps;
  final int duration;
  final bool isApproved;
  String by;
  final int likes;

  Recipe({
    this.id = '',
    required this.recipeName,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isApproved,
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

  static Recipe fromJson(Map<String, dynamic> json) => Recipe(
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
