import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:se380_project/favorites_page.dart';
import 'package:se380_project/my_recipes.dart';
import 'add_recipe.dart';
import 'package:se380_project/recipe.dart';
import 'tags.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(250, 40),
                backgroundColor: Colors.grey.shade800,
              )),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.white,
          )),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> tags = AddRecipePage.getTags();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/images/bg.jpg"), fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
          child: Center(
            child: Column(
              children: <Widget>[
                const Expanded(
                  flex: 40,
                  child: Center(
                      child: Text(
                        "COOKBOOK",
                        style: TextStyle(
                            fontFamily: "DancingScript",
                            fontSize: 55,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Expanded(
                  flex: 60,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddRecipePage()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Add recipe"),
                              Icon(Icons.add),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyRecipes(
                                      recipeList: [

                                      ],
                                  selectedIndex: 0,
                                    )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("My Recipes"),
                              Icon(Icons.search),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FavoritesPage(recipeList: [],
                                    selectedIndex: 2,)),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Favourites"),
                              Icon(Icons.favorite),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: ElevatedButton(
                          onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TagsPage(tagList: tags,
                                selectedIndex: 2,)),
                          );},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Tags"),
                              Icon(Icons.tag_sharp),
                            ],
                          ),
                        ),
                      )
                    ],
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
