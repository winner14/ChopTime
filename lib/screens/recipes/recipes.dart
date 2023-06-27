import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/cards/recipe_card.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class Recipes extends StatefulWidget {
  const Recipes({super.key});

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
                  padding: EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CMText(
                        text: 'Recipes that match your ingredients:',
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, index) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.0, vertical: 4),
                            child: RecipeCard(),
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
