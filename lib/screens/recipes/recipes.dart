import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
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
      onTap: () => Navigator.of(context).pop(),
      child: DraggableScrollableSheet(
        initialChildSize: .83,
        maxChildSize: 1,
        minChildSize: .7,
        builder: (_, controller) => Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            color: myBgColorLight,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
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
                Expanded(
                  child: ListView(
                    controller: controller,
                    children: [CMText(text: 'text')],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
