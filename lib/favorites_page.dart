
import 'package:flutter/material.dart';
import 'package:se380_project/recipe.dart';
import 'package:se380_project/recipe_list_view.dart';

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
          child: RecipeListView(
              recipeList: checkFavorite(widget.recipeList),
          ),
        )
    );
  }
}
