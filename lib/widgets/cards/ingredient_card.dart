import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: myBgColorLight,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(width: .8, color: Colors.black12),
      ),
      // child: Column(
      //   children: [
      //     Image(image: AssetImage('assetName'))
      //   ],
      // ),
    );
  }
}
