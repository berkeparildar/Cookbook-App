import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:se380_project/favorites_page.dart';
import 'package:se380_project/my_recipes.dart';
import 'package:se380_project/recipe_inspect.dart';
import 'add_recipe.dart';
import 'package:se380_project/recipe.dart';
import 'package:se380_project/google_sign_in.dart';
import 'firebase_options.dart';
import 'tags.dart';

void main() {
  runApp(MyApp());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFireBaseInit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    setState(() {
      isFireBaseInit = true;
    });
    if (FirebaseAuth.instance.currentUser != null) {
      goToMain();
    }
    //goToMain();
  }

  void goToMain() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
  }

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
                          onPressed: () async {
                            await signInWithGoogle();
                            goToMain();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Login"),
                              Icon(Icons.add),
                            ],
                          ),
                        ),
                      ),
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
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static List<Recipe> getRecipes() {
    return _MyHomePageState.recipes;
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Image.file(new File("Assets/images/bg.jpg"))
class _MyHomePageState extends State<MyHomePage> {
  List<String> tags = AddRecipePage.getTags();

  static List<Recipe> recipes = [
    Recipe(
      name: "Keskek",
      description: "good meal with good nutrients",
      notes: "best when its hot",
      selectedTags: ["Turkish", "Dinner"],
      ingredients: "meat",
      method: "Its hard to do.",
      cookingTime: "04:00",
      preparingTime: "06:00",
      hours: 0,
      minutes: 0,
      seconds: 5,
    ),
    Recipe(
      name: "Fried Chicken",
      description: "Chicken that is fried. ",
      notes: "Usually okay.",
      selectedTags: ["Lunch", "Dinner"],
      ingredients: "chicken",
      method: "Just fry it.",
      cookingTime: "00:10",
      preparingTime: "00:20",
      hours: 0,
      minutes: 1,
      seconds: 6,
    ),
  ];

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
                                      recipeList: recipes,
                                      selectedIndex: 0,
                                    )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("My recipes"),
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
                                  builder: (context) => FavoritesPage(
                                        recipeList: recipes,
                                        selectedIndex: 2,
                                      )),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TagsPage(
                                        tagList: tags,
                                        selectedIndex: 2,
                                      )),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Tags"),
                              Icon(Icons.tag_sharp),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: ElevatedButton(
                          onPressed: () async {
                            await signOutWithGogle();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => SplashScreen()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Sign Out"),
                              Icon(Icons.logout),
                            ],
                          ),
                        ),
                      ),
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
