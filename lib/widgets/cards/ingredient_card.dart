import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class IngredientCard extends StatelessWidget {
  final String ingredient;
  final bool isSelected;
  const IngredientCard(
      {Key? key, required this.ingredient, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? myFgColorDark
            : myFgColorLight,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          width: isSelected == false ? .8 : 1.2,
          color: isSelected == false ? Colors.black12 : mySecondaryColor,
        ),
      ),
      child: Center(
        child: CMText(
          text: ingredient,
          color: Theme.of(context).brightness == Brightness.dark
              ? myTextColorDark
              : myTextColorLight,
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
