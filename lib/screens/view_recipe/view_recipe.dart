import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class ViewRecipe extends StatefulWidget {
  final String recipeName;
  final List ingredients;
  final List steps;
  final int duration;
  const ViewRecipe({
    Key? key,
    required this.duration,
    required this.ingredients,
    required this.recipeName,
    required this.steps,
  }) : super(key: key);

  @override
  State<ViewRecipe> createState() => _ViewRecipeState();
}

class _ViewRecipeState extends State<ViewRecipe> {
  ScrollController _outerScrollController = ScrollController();
  ScrollController _innerScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _innerScrollController.addListener(_onInnerScroll);
  }

  @override
  void dispose() {
    _innerScrollController.removeListener(_onInnerScroll);
    super.dispose();
  }

  // Inner scroll view has reached its end, scroll the outer scroll view down or up.
  void _onInnerScroll() {
    if (_innerScrollController.position.atEdge &&
        _innerScrollController.position.pixels != 0) {
      _outerScrollController.animateTo(
        _outerScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    if (_innerScrollController.position.atEdge &&
        _innerScrollController.position.pixels == 0) {
      _outerScrollController.animateTo(
        _outerScrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CMText(
          text: widget.recipeName.toUpperCase().length > 30
              ? '${widget.recipeName.substring(0, 30)}...'
              : widget.recipeName.toUpperCase(),
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
                child: SingleChildScrollView(
                  controller: _outerScrollController,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 6, 6, 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CMText(
                              text: 'Ingredients',
                              fontSize: 20,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? myTextColorDark
                                  : myTextColorLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          width: width,
                          height: 50,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? myFgColorDark
                                    : myFgColorLight,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListView.builder(
                              padding: const EdgeInsets.all(2),
                              itemCount: widget.ingredients.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0, vertical: 4),
                                  child: Container(
                                    // width: 50,
                                    // height: 40,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? myBgColorDark
                                          : myBgColorLight,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CMText(
                                          text: widget.ingredients[index],
                                          fontSize: 18,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? myTextColorDark
                                              : myTextColorLight,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 6, 6, 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CMText(
                              text: 'Steps',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? myTextColorDark
                                  : myTextColorLight,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          width: width,
                          height: 10 + widget.steps.length * 40.0,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? myFgColorDark
                                    : myFgColorLight,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListView.builder(
                            controller: _innerScrollController,
                            itemCount: widget.steps.length,
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.all(2),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3.0, vertical: 1),
                                child: Container(
                                  // width: 50,
                                  // height: 40,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? myBgColorDark
                                        : myBgColorLight,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: CMText(
                                              text:
                                                  '${index + 1}. ${widget.steps[index]}',
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? myTextColorDark
                                                  : myTextColorLight,
                                              fontSize: 18,
                                              softWrap: true,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CMText(
                                text: 'Estimated Time: ${widget.duration} mins',
                                fontSize: 16,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? myTextColorDark
                                    : myTextColorLight,
                              ),
                            ),
                          ],
                        ),
                      ),
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
