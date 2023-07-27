import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class RecipeCard extends StatefulWidget {
  final String recipeName;
  final int duration;
  final int likes;
  final String by;
  final String imageUrl;
  const RecipeCard({
    Key? key,
    required this.recipeName,
    required this.duration,
    required this.likes,
    required this.by,
    required this.imageUrl,
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
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .95,
      height: 240,
      decoration: BoxDecoration(
        color: myBgColorLight,
        border: Border.all(width: .4, color: Colors.black12),
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20), bottom: Radius.circular(10)),
        image: DecorationImage(
          image: widget.imageUrl == ''
              ? const AssetImage('assets/images/default-recipe-image.png')
              : NetworkImage(widget.imageUrl) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? const Color(0xB14CAF4F)
                  : const Color(0xAF000000),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            height: 87,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CMText(
                        text: widget.recipeName,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CMText(
                            text: 'Cooking time: ',
                            fontSize: 18,
                          ),
                          CMText(
                            text: '${widget.duration} minutes',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                liked = !liked;
                                if (liked == true) {
                                  likeCount++;
                                } else {
                                  likeCount--;
                                }
                              });
                            },
                            child: liked == true
                                ? const Icon(
                                    Icons.favorite,
                                    size: 30,
                                    color: myTextColorDark,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                    size: 30,
                                    color: myTextColorDark,
                                  ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: CMText(
                              text: '${widget.likes}',
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: CMText(
                              text: widget.by,
                              fontSize: 18,
                            ),
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
        ],
      ),
    );
  }
}
