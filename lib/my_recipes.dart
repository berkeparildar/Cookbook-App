import 'package:flutter/material.dart';
import 'package:se380_project/bottom_bar.dart';
import 'package:se380_project/recipe.dart';
import 'package:se380_project/recipe_list_view.dart';

class MyRecipes extends StatefulWidget {
  const MyRecipes({Key? key, required this.recipeList, required this.selectedIndex}) : super(key: key,);
  final List<Recipe> recipeList;
  final int selectedIndex;
  @override
  State<MyRecipes> createState() => _MyRecipesState();
}

class _MyRecipesState extends State<MyRecipes> {
  Text a = Text("");
  final _formKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();
  Widget check() {
    int length = 0;
    Widget toReturn = const Text("data");
    String fullLength = widget.recipeList.length.toString();
      if (searchController.text.isEmpty){
        a = Text("Showing $fullLength of $fullLength");
        print("in the first if?");
        toReturn = RecipeListView(
            recipeList: widget.recipeList);
      }
      else if (searchController.text.isNotEmpty) {
        List<Recipe> temp = [];
        print("in the else");
        for(int i = 0; i < widget.recipeList.length; i++){
          if (widget.recipeList[i].name.toLowerCase().contains(searchController.text, 0)){
            temp.add(widget.recipeList[i]);
          }
        }
        length = temp.length;
        a = Text("Showing $length of $fullLength");
        toReturn = RecipeListView(recipeList: temp);
      }
    return toReturn;
  }
  @override
  Widget build(BuildContext context) {
    Widget x = check();
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
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: searchController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                 fillColor: Colors.grey.shade800,
                  hintText: "Search by keywords..",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14
                  ),
                  contentPadding: EdgeInsets.all(12),
                  constraints: BoxConstraints(
                    maxHeight: 30
                  )
                ),
                onSaved: (value) {
                  searchController.text = value!;
                },
                onChanged: (value) {
                  print("written $value");
                  setState(() {
                  });
                },
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Center(
                child: a,
                ),
              ),
            x,
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: widget.selectedIndex,
      ),
    );
  }
}
