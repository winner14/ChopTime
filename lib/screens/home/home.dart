import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/screens/recipes/recipes.dart';
import 'package:mini_project/widgets/button/button.dart';
import 'package:mini_project/widgets/cards/ingredient_card.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchController = TextEditingController();
  String search = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CMText(
                            text: 'Hello, ',
                            color: myBgColorLight,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                          CMText(
                            text: 'Winner', // add function later
                            color: myBgColorLight,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      CMText(
                        text: 'Ready for a Meal?',
                        color: myBgColorLight,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(
                        child: Image(
                      image: AssetImage('assets/images/boy_profile.png'),
                    )),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: height * .8,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: myBgColorLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: SizedBox(
                  height: .8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: SizedBox(
                          height: 55,
                          // width: width * .95,
                          child: TextField(
                            controller: searchController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: mySecondaryColor,
                                  width: .5,
                                ),
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(15),
                                  left: Radius.circular(15),
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(15),
                                  left: Radius.circular(15),
                                ),
                                borderSide: BorderSide(
                                    color: mySecondaryColor, width: .5),
                              ),
                              iconColor: mySecondaryColor,
                              // labelText: label,
                              hintText: 'Search to add ingredients',
                              // prefixIcon: icon,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  // searchController.clear();
                                },
                                icon: const Icon(
                                  Icons.search_rounded,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                search = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GridView.builder(
                            itemCount: 15,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5),
                            itemBuilder: (context, index) {
                              return const IngredientCard();
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: height * .18,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: myPrimaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 18),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Center(
                                      child: CMText(
                                        text: 'Selected Ingredients',
                                        color: myPrimaryTextColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF045007),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: const Center(
                                        child: CMText(
                                      text: '20',
                                      color: myPrimaryTextColor,
                                      fontSize: 18,
                                    )),
                                  )
                                ],
                              ),
                              CMButton(
                                text: "Let's Cook!",
                                textSize: 20,
                                fontWeight: FontWeight.w500,
                                width: width * .95,
                                onPressed: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) => const Recipes(),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:mini_project/constants.dart';
// import 'package:mini_project/widgets/cards/ingredient_box.dart';
// import 'package:mini_project/widgets/image/cm_image.dart';
// import 'package:mini_project/widgets/text/cm_text.dart';
// import 'package:mini_project/widgets/text_input/cm_text_input.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final searchController = TextEditingController();
//   String search = '';

//   @override
//   void dispose() {
//     searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       // appBar: AppBar(
//       //   automaticallyImplyLeading: false,
//       //   elevation: 0,
//       //   backgroundColor: Colors.transparent,
//       //   // title: const CMText(
//       //   //   text: 'Genie',
//       //   //   fontSize: 35,
//       //   //   fontWeight: FontWeight.w500,
//       //   // ),
//       // ),
//       // extendBodyBehindAppBar: true,
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           color: myPrimaryColor,
//           image: DecorationImage(
//             image: AssetImage('assets/images/topBg.png'),
//             repeat: ImageRepeat.repeat,
//             opacity: 0.35,
//           ),
//         ),
//         child: Column(
//           children: [
//             Container(
//               height: height * .18,
//               decoration: const BoxDecoration(
//                 color: Colors.transparent,
//                 // image: DecorationImage(
//                 //   image: AssetImage('assets/images/topBg.png'),
//                 //   fit: BoxFit.cover,
//                 //   repeat: ImageRepeat.repeat,
//                 //   opacity: 0.35,
//                 // ),
//               ),
//               child: const Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 CMText(
//                                   text: 'Hello, ',
//                                   color: myBgColorLight,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                                 CMText(
//                                   text: 'Winner', // add function later
//                                   color: myBgColorLight,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ],
//                             ),
//                             CMText(
//                               text: 'Ready for a Meal?',
//                               color: myBgColorLight,
//                               fontSize: 25,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 60,
//                           width: 60,
//                           child: CircleAvatar(
//                             child: GenieImage(
//                               image: 'assets/images/boy_profile.png',
//                               fit: 'fill',
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: height * .82,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15),
//                   topRight: Radius.circular(15),
//                 ),
//               ),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         controller: searchController,
//                         keyboardType: TextInputType.text,
//                         textInputAction: TextInputAction.search,
//                         decoration: InputDecoration(
//                           contentPadding:
//                               const EdgeInsets.symmetric(horizontal: 15),
//                           focusedBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: mySecondaryColor,
//                               width: .5,
//                             ),
//                             borderRadius: BorderRadius.horizontal(
//                               right: Radius.circular(15),
//                               left: Radius.circular(15),
//                             ),
//                           ),
//                           border: const OutlineInputBorder(
//                             borderRadius: BorderRadius.horizontal(
//                               right: Radius.circular(15),
//                               left: Radius.circular(15),
//                             ),
//                             borderSide:
//                                 BorderSide(color: mySecondaryColor, width: 5),
//                           ),
//                           iconColor: mySecondaryColor,
//                           // labelText: label,
//                           hintText: 'Search to add ingredients',
//                           // prefixIcon: icon,
//                           suffixIcon: IconButton(
//                             onPressed: () {
//                               // searchController.clear();
//                             },
//                             icon: const Icon(
//                               Icons.search_rounded,
//                               color: Colors.black45,
//                             ),
//                           ),
//                         ),
//                         onChanged: (value) {
//                           setState(() {
//                             search = value;
//                           });
//                         },
//                       ),
//                     ),
//                     SingleChildScrollView(
//                       child: SizedBox(
//                         height: height * .7,
//                         child: ListView.builder(
//                           itemCount: 5,
//                           itemBuilder: (context, index) {
//                             return const IngredientBox();
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
