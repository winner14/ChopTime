import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/cards/recipe_card.dart';

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
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: myPrimaryColor,
          image: DecorationImage(
              image: AssetImage('assets/images/topBg.png'),
              repeat: ImageRepeat.repeat,
              opacity: .35),
        ),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Container(
                height: height * .85,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: myBgColorLight,
                  borderRadius: BorderRadius.only(
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
                              child: RecipeCard(),
                            );
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
