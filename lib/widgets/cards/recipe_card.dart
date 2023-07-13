import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .95,
      height: 220,
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
            color: const Color(0x875C501B),
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CMText(
                        text: 'Braised Rice (Angwamo)',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CMText(
                            text: 'Cooking time: ',
                            fontSize: 18,
                          ),
                          CMText(
                            text: '30 minutes',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.black12,
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
