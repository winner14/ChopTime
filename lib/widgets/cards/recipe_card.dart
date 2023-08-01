import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

import '../../screens/view_recipe/view_recipe.dart';

class RecipeCard extends StatefulWidget {
  final String recipeName;
  final int duration;
  final int likes;
  final String by;
  final List ingredients;
  final List steps;
  // final String imageUrl;
  const RecipeCard({
    Key? key,
    required this.recipeName,
    required this.duration,
    required this.likes,
    required this.by,
    required this.ingredients,
    required this.steps,
    // required this.imageUrl,
  }) : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool liked = false;
  int likeCount = 0;

  bool isAddedToFavorites = false;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        nextScreen(
            context,
            ViewRecipe(
              recipeName: widget.recipeName,
              duration: widget.duration,
              ingredients: widget.ingredients,
              steps: widget.steps,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? const Color(0xB14CAF4F)
                : const Color(0xAF000000),
            borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10), top: Radius.circular(10)),
          ),
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CMText(
                      text: widget.recipeName.length > 18
                          ? '${widget.recipeName.substring(0, 18)}...'
                              .toUpperCase()
                          : widget.recipeName.toUpperCase(),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CMText(
                          text: 'Cooking time: ',
                          fontSize: 20,
                        ),
                        CMText(
                          text: '${widget.duration} minutes',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        // GestureDetector(
                        //   onTap: () {
                        //     setState(() {
                        //       liked = !liked;
                        //       if (liked == true) {
                        //         likeCount++;
                        //       } else {
                        //         likeCount--;
                        //       }
                        //     });
                        //   },
                        //   child: liked == true
                        //       ? const Icon(
                        //           Icons.favorite,
                        //           size: 30,
                        //           color: myTextColorDark,
                        //         )
                        //       : const Icon(
                        //           Icons.favorite_border_outlined,
                        //           size: 30,
                        //           color: myTextColorDark,
                        //         ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        //   child: CMText(
                        //     text: '${widget.likes}',
                        //     fontSize: 18,
                        //   ),
                        // ),
                        Row(
                          children: [
                            const CMText(
                              text: 'By: ',
                              fontSize: 20,
                            ),
                            CMText(
                              text: widget.by,
                              fontSize: 20,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isAddedToFavorites = !isAddedToFavorites;
                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.black54,
                    ),
                    child: Icon(
                      isAddedToFavorites == true
                          ? Icons.bookmark
                          : Icons.bookmark_border_outlined,
                      size: 45,
                      color: const Color(0x93F7FDF7),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
