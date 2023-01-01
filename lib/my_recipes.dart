import 'package:flutter/material.dart';
import 'package:se380_project/bottom_bar.dart';
import 'package:se380_project/recipe.dart';
import 'package:se380_project/recipe_list_view.dart';

class MyRecipes extends StatefulWidget {
  const MyRecipes({Key? key, required this.recipeList}) : super(key: key,);
  final List<Recipe> recipeList;
  @override
  State<MyRecipes> createState() => _MyRecipesState();
}

class _MyRecipesState extends State<MyRecipes> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();
  Widget check() {
    Widget toReturn = const Text("data");
    setState(() {
      if (searchController.text.isEmpty){
        toReturn = RecipeListView(
            recipeList: widget.recipeList);
      }
      else {
        for(int i = 0; i < widget.recipeList.length; i++){
          if (widget.recipeList[i].name.contains(searchController.text, 0)){
            List<Recipe> temp = [];
            temp.add(widget.recipeList[i]);
            toReturn = RecipeListView(recipeList: temp);
          }
        }
      }
    });
    return toReturn;
  }
  @override
  Widget build(BuildContext context) {
    String a = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: const Text("CookBook"),
        titleTextStyle: const TextStyle(
          fontFamily: "DancingScript",
          fontSize: 35,
        ),
        centerTitle: true,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            children: [
              Container(
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.name,
                    onSaved: (value) {
                      searchController.text = value!;
                    },
                    onChanged: (value) {
                      print("written $value");
                      setState(() {
                      });
                    },
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
              check(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
