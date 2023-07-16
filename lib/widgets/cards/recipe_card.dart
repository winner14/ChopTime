import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class RecipeCard extends StatefulWidget {
  final String recipeName;
  final int duration;
  final int likes;
  const RecipeCard({
    Key? key,
    required this.recipeName,
    required this.duration,
    required this.likes,
  }) : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool liked = false;
  int likeCount = 0;

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
        image: const DecorationImage(
          image: AssetImage('assets/images/braised_rice.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(178, 76, 175, 79),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            height: 86,
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
                                likeCount++;
                              });
                            },
                            child: liked == true
                                ? const Icon(
                                    Icons.favorite,
                                    size: 30,
                                    color: myPrimaryTextColor,
                                  )
                                : const Icon(
                                    Icons.favorite_border_outlined,
                                    size: 30,
                                    color: myPrimaryTextColor,
                                  ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: CMText(
                              text: '${widget.likes}',
                              fontSize: 18,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color.fromARGB(148, 247, 253, 247),
                    ),
                    child: const Icon(
                      Icons.bookmark_outline_outlined,
                      size: 45,
                      color: Colors.black54,
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
