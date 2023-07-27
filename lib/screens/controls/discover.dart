import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/cards/recipe_card.dart';
import 'package:mini_project/widgets/loading_screen/loading_screen.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const CMText(
            text: 'Discover',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
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
                  child: StreamBuilder<List<Recipes>>(
                      stream: getRecipes(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final recipes = snapshot.data!;

                          return SizedBox(
                            height: height * .8,
                            width: double.infinity,
                            child: ListView(
                              padding: const EdgeInsets.only(top: 0),
                              children: recipes.map(buildRecipes).toList(),
                            ),
                          );
                        } else {
                          print(snapshot.error);
                          return const Loading();
                        }
                      }),
                )
              ],
            ),
          ),
        ));
  }

  Widget buildRecipes(Recipes recipes) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 2),
      child: RecipeCard(
        recipeName: recipes.recipeName,
        duration: recipes.duration,
        likes: recipes.likes,
        by: recipes.by,
        imageUrl: recipes.imageUrl,
      ),
    );
  }

  Stream<List<Recipes>> getRecipes() => FirebaseFirestore.instance
      .collection('recipes')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Recipes.fromJson(doc.data())).toList());
}

class Recipes {
  String id;
  final String recipeName;
  final List ingredients;
  final List steps;
  final int duration;
  final bool isApproved;
  final String imageUrl;
  String by;
  final int likes;

  Recipes({
    this.id = '',
    required this.recipeName,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isApproved,
    this.by = 'Community',
    this.imageUrl = '',
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
        'imageUrl': imageUrl,
        'likes': likes,
      };

  static Recipes fromJson(Map<String, dynamic> json) => Recipes(
        id: json['id'],
        recipeName: json['recipeName'],
        ingredients: json['ingredients'],
        steps: json['Steps'],
        duration: json['duration'],
        isApproved: json['isApproved'],
        imageUrl: json['imageUrl'],
        by: json['by'],
        likes: json['likes'],
      );
}
