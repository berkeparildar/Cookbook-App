import 'package:flutter/material.dart';
import 'package:se380_project/add_recipe.dart';
import 'package:se380_project/bottom_bar.dart';
import 'package:se380_project/my_recipes.dart';
import 'package:se380_project/recipe.dart';



class TagsPage extends StatelessWidget {
  final List<String> tagList;

  TagsPage({super.key, required this.tagList, required int selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
          selectedIndex: 2,
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(color: Colors.grey.shade900),
          child: Padding(
            padding: EdgeInsets.all(4),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              children: tagList.map((e) => TagsInList(tag: e)).toList(),
            ),
          ),
        ));
  }
}

class TagsInList extends StatelessWidget {
  TagsInList({Key? key, required this.tag}) : super(key: key);

  final String tag;
  List<Recipe> selectedRecipe = [];

  static List<Recipe> recipeList = [];

  List<Recipe> returnRecipeList(List<Recipe> arr, String tag){
    List<Recipe> toReturn = [];
    for (int i = 0; i < arr.length ; i++){
      if (arr[i].selectedTags.contains(tag)){
        toReturn.add(arr[i]);
      }
    }
    return toReturn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyRecipes(
                    recipeList: returnRecipeList(recipeList, tag),
                  selectedIndex: 2,
                )),
          );
        },
        child: Center(
          child: Text(
            tag,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}



class DisplaySelection extends StatelessWidget {
  List<Recipe> recipes;
  DisplaySelection({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade800,
          title: Text("CookBook"),
          titleTextStyle: TextStyle(
            fontFamily: "DancingScript",
            fontSize: 35,
          ),
          centerTitle: true,
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(color: Colors.grey.shade900),
          child: GridView.count(
            crossAxisCount: 3,
            children: recipes.map((e) => RecipesInList(recipe: e)).toList(),
          ),
        ),
    );
  }

}

class RecipesInList extends StatelessWidget {
  final Recipe recipe;
  const RecipesInList({Key? key, required this.recipe}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ElevatedButton(
        onPressed: () {

        },
        child: SizedBox(
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                recipe.name,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );

  }

}




