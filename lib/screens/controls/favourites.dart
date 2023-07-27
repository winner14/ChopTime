import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/cards/recipe_card.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const CMText(
          text: 'Favorites',
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 0),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.0),
                                child: RecipeCard(
                                  recipeName: 'Braised Rice',
                                  duration: 10,
                                  likes: 20,
                                  by: 'Community',
                                  imageUrl: '',
                                ));
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
