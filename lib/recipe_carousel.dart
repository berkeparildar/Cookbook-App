import 'package:flutter/material.dart';
import 'package:se380_project/recipe.dart';

import 'main.dart';

class RecipeCarousel extends StatefulWidget {
  const RecipeCarousel({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  State<RecipeCarousel> createState() => _RecipeCarouselState();
}

class _RecipeCarouselState extends State<RecipeCarousel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              });
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.grey.shade800,
          title: const Text("CookBook"),
          titleTextStyle: const TextStyle(
            fontFamily: "DancingScript",
            fontSize: 35,
          ),
          centerTitle: true,
        ),
        body: CarouselPage(recipe: widget.recipe),
      ),
    );
  }
}

class CarouselPage extends StatelessWidget {
  const CarouselPage({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.shade800
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Column(
                  children: [
                    const Icon(Icons.access_alarm_outlined),
                    const Padding(padding: EdgeInsets.all(4)),
                    Text('Prep: ${recipe.preparingTime}')
                  ],
                ),
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: Column(
                  children: [
                    const Icon(Icons.present_to_all),
                    const Padding(padding: EdgeInsets.all(4)),
                    Text('Cook: ${recipe.cookingTime}')
                  ],
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Column(
                    children: [
                      const Icon(Icons.shopping_bag_outlined),
                      const Padding(padding: EdgeInsets.all(4)),
                      Text('${recipe.ingredients.length} ingredients')
                    ],
                  ),
                ),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Column(
                    children: [
                      const Icon(Icons.restaurant),
                      const Padding(padding: EdgeInsets.all(4)),
                      Text('${recipe.name}')
                    ],
                  ),
                ),
              ],
            )
          ]),
        )
      ],
    );
  }
}
