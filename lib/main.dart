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
      ))),
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
      body: Center(
        child: Column(
          children: <Widget>[
            const Expanded(
              flex: 40,
              child: Center(
                  child: Text(
                "COOKBOOK",
                style: TextStyle(fontFamily: "DancingScript", fontSize: 55),
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
    );
  }
}

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipePage> {
  final myController = TextEditingController();


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
  final _formKey = GlobalKey<FormState>(); //sm
  final _formKey1 = GlobalKey<FormState>(); //sm
  final _formKey2 = GlobalKey<FormState>(); //sm
  final TextEditingController recipeNameController = TextEditingController();//sm
  final TextEditingController recipeDescriptionController = TextEditingController();//sm
  final TextEditingController recipeNoteContoller = TextEditingController();//sm

  String? recipeName, recipeDescription, recipeNotes;//sm

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: textFieldColor,
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
            Form(
              key: _formKey1,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: textFieldColor,
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
            Form(
              key: _formKey2,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Notes',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: textFieldColor,
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
            ElevatedButton(onPressed: () {
              recipeName = recipeNoteContoller.text;
              recipeDescription = recipeDescriptionController.text;
              recipeNotes = recipeNoteContoller.text;

              Recipe addRecipe = Recipe(name: recipeName.toString(),
                  description: recipeDescription.toString(),
                  notes: recipeNotes.toString());
                  print("Add this "+ addRecipe.toString()+" object to firebase.");
            },
                child: Text("publish recipe")),
          ],
        ),
      ),
    );  

  }
}
