import 'dart:ui';

import 'package:flutter/material.dart';
import 'recipe.dart';

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

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

const List<Widget> listOfTags = <Widget>[
  Text("Asian"),
  Text("Breakfast"),
  Text("Dinner"),
  Text("Dessert")
];

const List<String> placeHolder = <String>[
  "a",
];

class _AddRecipeState extends State<AddRecipePage> {
  final myController = TextEditingController();
  final List<bool> selectedTags = <bool>[false, false, false, false];

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  Color textFieldColor = Colors.grey.shade400;
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final TextEditingController recipeNameController =
      TextEditingController();
  final TextEditingController recipeDescriptionController =
      TextEditingController();
  final TextEditingController recipeNoteContoller =
      TextEditingController();

  String? recipeName, recipeDescription, recipeNotes; //sm

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Text("CookBook"),
        titleTextStyle: TextStyle(
          fontFamily: "DancingScript",
          fontSize: 35,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {
              recipeName = recipeNoteContoller.text;
              recipeDescription = recipeDescriptionController.text;
              recipeNotes = recipeNoteContoller.text;
              Recipe addRecipe = Recipe(
                name: recipeName.toString(),
                description: recipeDescription.toString(),
                notes: recipeNotes.toString(),
                selectedTags: placeHolder,
              );
              print(
                  "Add this " + addRecipe.toString() + " object to firebase.");
            },
            child: Row(
              children: const [
                Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Icon(Icons.check_outlined)
              ],
            ),
          ),
        ],
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(color: Colors.grey.shade900),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 4,
                    )),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Vegetable Lasagna',
                        ),
                        onChanged: (text) {
                          print('First text field: $text');
                        },
                        controller: recipeNameController,
                        keyboardType: TextInputType.name,
                        onSaved: (value) {
                          recipeNameController.text = value!;
                        },
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Description",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 4,
                    )),
                    Form(
                      key: _formKey1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Wholesome hearty winter lasagna recipe',
                        ),
                        onChanged: (text) {
                          print('First text field: $text');
                        },
                        controller: recipeDescriptionController,
                        keyboardType: TextInputType.name,
                        onSaved: (value) {
                          recipeDescriptionController.text = value!;
                        },
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Recipe Notes",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 4,
                    )),
                    Form(
                      key: _formKey2,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Best served with crusty garlic bread',
                          filled: true,
                        ),
                        onChanged: (text) {
                          print('First text field: $text');
                        },
                        controller: recipeNoteContoller,
                        keyboardType: TextInputType.name,
                        onSaved: (value) {
                          recipeNoteContoller.text = value!;
                        },
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  children: const [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Tags",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 4,
                    )),
                  ],
                ),
              ),
              ToggleButtons(
                constraints: const BoxConstraints(
                  minHeight: 60,
                  minWidth: 80
                ),
                color: Colors.white,
                isSelected: selectedTags,
                selectedColor: Colors.white,
                borderColor: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                fillColor: Colors.blueGrey,
                selectedBorderColor: Colors.blueGrey,
                onPressed: (int i){
                  setState((){
                    selectedTags[i] = !selectedTags[i];
                  });
                },
                children: listOfTags,
              )
            ],
          ),
        ),
      ),
    );
  }
}
