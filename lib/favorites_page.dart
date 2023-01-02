
import 'package:flutter/material.dart';
import 'package:se380_project/main.dart';
import 'package:se380_project/recipe.dart';
import 'package:se380_project/recipe_list_view.dart';

import 'bottom_bar.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({Key? key, required this.recipeList, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;
  final List<Recipe> recipeList;

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  List<Recipe> checkFavorite(List<Recipe> listRecipe){
    List<Recipe> toReturn = [];
    for (int i = 0; i < listRecipe.length; i++){
      if (listRecipe[i].isFavorite == true){
        toReturn.add(listRecipe[i]);
      }
    }
    return toReturn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage()),
              );
            });
          }, child: Icon(Icons.arrow_back,
        color: Colors.white,),
        ),
        backgroundColor: Colors.grey.shade800,
        title: const Text("CookBook"),
        titleTextStyle: const TextStyle(
          fontFamily: "DancingScript",
          fontSize: 35,
        ),
        centerTitle: true,

      ),
        bottomNavigationBar: BottomBar(
          isInAddRecipe: false,
          selectedIndex: 1,
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
          ),
          child: RecipeListView(
              recipeList: checkFavorite(widget.recipeList),
          ),
        )
    );
  }
}
