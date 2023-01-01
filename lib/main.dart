import 'dart:ui';

import 'package:flutter/material.dart';
import 'add_recipe.dart';
import 'recipe.dart';
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
        decoration: BoxDecoration(
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
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddRecipePage()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Add recipe"),
                            const Icon(Icons.add),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("My Recipes"),
                            const Icon(Icons.search),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Favourites"),
                            const Icon(Icons.favorite),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TagsPage(tagList: tags,)),
                        );},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Tags"),
                            const Icon(Icons.tag_sharp),
                          ],
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


