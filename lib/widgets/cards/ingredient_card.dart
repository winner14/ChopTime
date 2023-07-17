import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class IngredientCard extends StatelessWidget {
  final String ingredient;
  const IngredientCard({Key? key, required this.ingredient}) : super(key: key);

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
      child: Column(
        children: [
          CMText(
            text: ingredient,
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
