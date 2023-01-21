
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:se380_project/bottom_bar.dart';
import 'package:se380_project/main.dart';
import 'package:se380_project/recipe.dart';


class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  static List<String> getTags() {
    return _AddRecipeState.tagList;
  }

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

const List<Widget> listOfTags = <Widget>[
  Text("Asian"),
  Text("Breakfast"),
  Text("Dinner"),
  Text("Dessert"),
  Text("Turkish"),
  Text("Indian"),
  Text("Vegetarian"),
  Text("Salads"),
  Text("Soups"),
  Text("Italian"),
  Text("Lunch"),
  Text("Snacks")
];

class _AddRecipeState extends State<AddRecipePage> {
  final myController = TextEditingController();
  final List<bool> selectedTags = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  static final List<String> tagList = <String>[
    "Asian",
    "Breakfast",
    "Dinner",
    "Dessert",
    "Turkish",
    "Indian",
    "Vegetarian",
    "Salads",
    "Soups",
    "Italian",
    "Lunch",
    "Snacks"
  ];
  List<String> addRecipeTags = <String>[];

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
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
  final _formKey4 = GlobalKey<FormState>();
  final _formKey5 = GlobalKey<FormState>();
  final _formKey6 = GlobalKey<FormState>();
  final _formKey7 = GlobalKey<FormState>();
  final _formKey8 = GlobalKey<FormState>();
  final _formKey9 = GlobalKey<FormState>();
  final TextEditingController recipeNameController = TextEditingController();
  final TextEditingController recipeDescriptionController =
      TextEditingController();
  final TextEditingController recipeNoteContoller = TextEditingController();
  final TextEditingController ingredientController = TextEditingController();
  final TextEditingController methodController = TextEditingController();
  final TextEditingController cookingTController = TextEditingController();
  final TextEditingController preparingTController = TextEditingController();
  final TextEditingController preparingHController = TextEditingController();
  final TextEditingController preparingMController = TextEditingController();

  String? recipeName,
      recipeDescription,
      recipeNotes,
      recipeIngredient,
      recipeMethod,
      cookingTime,
      preparingTime,
      preparingH,
      preparingM,
      preparingTimeHour,
      preparingTimeMin;

  //Image recipePic = Image.file(new File("Assets/images/tag_images/asian.jpg"));
  Image? recipePic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: const Text("CookBook"),
        titleTextStyle: const TextStyle(
          fontFamily: "DancingScript",
          fontSize: 35,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: saveRecipe,
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.grey.shade900),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      const Align(
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
                      const Padding(
                          padding: EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 4,
                      )),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Vegetable Lasagna',
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
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      const Align(
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
                      const Padding(
                          padding: EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 4,
                      )),
                      Form(
                        key: _formKey1,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Wholesome hearty winter lasagna recipe',
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
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      const Align(
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
                      const Padding(
                          padding: EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 4,
                      )),
                      Form(
                        key: _formKey2,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Best served with crusty garlic bread',
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
                  padding: const EdgeInsets.all(6),
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
                buildToggleButtons(0, 3),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0)),
                buildToggleButtons(3, 6),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0)),
                buildToggleButtons(6, 9),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0)),
                buildToggleButtons(9, 12),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        children: [
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Ingredients",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )),
                          const Padding(
                              padding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 6,
                          )),
                          Form(
                              key: _formKey4,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                  ),
                                    hintText:
                                        "Enter your ingredients here.\nSeperate the ingredients with '+' sign."),
                                onChanged: (text) {
                                  print('First text field: $text');
                                },
                                controller: ingredientController,
                                keyboardType: TextInputType.name,
                                onSaved: (value) {
                                  ingredientController.text = value!;
                                },
                                textInputAction: TextInputAction.done,
                                maxLines: 5,
                                minLines: 2,
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        children: [
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Method",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )),
                          const Padding(
                              padding: EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 6,
                          )),
                          Form(
                              key: _formKey5,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "Enter your method here. \nSeperate the steps with '*' sign."),
                                onChanged: (text) {
                                  print('First text field: $text');
                                },
                                controller: methodController,
                                keyboardType: TextInputType.name,
                                onSaved: (value) {
                                  methodController.text = value!;
                                },
                                textInputAction: TextInputAction.done,
                                maxLines: 10,
                                minLines: 2,
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [ Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Cooking Time",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  )),
                              const Padding(
                                  padding: EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical: 6,
                              )),
                              SizedBox(
                                width: 70,
                                height: 50,
                                child: Form(
                                    key: _formKey6,
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                          hintText: "00:00",),
                                      onChanged: (text) {
                                        print('First text field: $text');
                                      },
                                      controller: cookingTController,
                                      keyboardType: TextInputType.name,
                                      onSaved: (value) {
                                        cookingTController.text = value!;
                                      },
                                      textInputAction: TextInputAction.done,
                                      maxLines: 1,
                                      minLines: 1,
                                    )),
                              ),
                            ],
                          ),
                        ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Preparation Time",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    )),
                                const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 0,
                                      vertical: 6,
                                    )),
                                SizedBox(
                                  width: 70,
                                  height: 50,
                                  child: Form(
                                      key: _formKey7,
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        decoration: const InputDecoration(
                                            hintText: "00:00"),
                                        onChanged: (text) {
                                          print('First text field: $text');
                                        },
                                        controller: preparingTController,
                                        keyboardType: TextInputType.name,
                                        onSaved: (value) {
                                          preparingTController.text = value!;
                                        },
                                        textInputAction: TextInputAction.done,
                                        maxLines: 10,
                                        minLines: 3,
                                      )),
                                ),
                              ],
                            ),
                          ),
                      ]
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void>  saveRecipeFirestore(Recipe pRecipe) async {
    MyHomePage.getRecipes().add(pRecipe);

    await FirebaseFirestore.instance.collection("recipes").add(pRecipe.toMap());

  }
  void saveRecipe() {
    recipeName = recipeNameController.text;
    recipeDescription = recipeDescriptionController.text;
    recipeNotes = recipeNoteContoller.text;
    recipeIngredient = ingredientController.text;
    recipeMethod = methodController.text;
    cookingTime = cookingTController.text;
    preparingTime = preparingTController.text;
    preparingH = preparingHController.text;
    preparingM = preparingMController.text;

    preparingTimeHour = preparingTController.text.split(":")[0];
    preparingTimeMin = preparingTController.text.split(":")[1];

    Recipe addRecipe = Recipe(
      name: recipeName.toString(),
      description: recipeDescription.toString(),
      notes: recipeNotes.toString(),
      selectedTags: addRecipeTags,
      ingredients: recipeIngredient.toString(),
      method: recipeMethod.toString(),
      cookingTime: cookingTController.text,
      preparingTime: preparingTController.text,
      hours: int.parse(preparingTimeHour.toString()),
      minutes: int.parse(preparingTimeMin.toString()),
      seconds: 0,
    );
    print("Add this " + addRecipe.toString() + " object to firebase.");
    print("The picture is saved too its reference is " + recipePic.toString());
    print(addRecipe.selectedTags);
    saveRecipeFirestore(addRecipe);
  }

  ToggleButtons buildToggleButtons(int start, int end) {
    return ToggleButtons(
      constraints: const BoxConstraints(
        minHeight: 30,
        minWidth: 90,
      ),
      color: Colors.white,
      isSelected: selectedTags.sublist(start, end),
      selectedColor: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      fillColor: Colors.blueGrey,
      borderColor: Colors.white,
      selectedBorderColor: Colors.blueGrey,
      onPressed: (int i) {
        setState(() {
          selectedTags[i + start] = !selectedTags[i + start];
          if (selectedTags[i + start] == true) {
            addRecipeTags.add(_AddRecipeState.tagList[i + start]);
          } else if (selectedTags[i + start] == false) {
            addRecipeTags.remove(_AddRecipeState.tagList[i + start]);
          }
        });
      },
      children: listOfTags.sublist(start, end),
    );
  }
}
