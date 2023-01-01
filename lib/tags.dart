import 'package:flutter/material.dart';
import 'package:se380_project/add_recipe.dart';
import 'recipe.dart';

Recipe r1 = Recipe(name: "kuru fasulye", description: "yemek", notes: "yap",
    selectedTags: ["Turkish"]);

Recipe r2 = Recipe(name: "keskek", description: "yemek", notes: "yap",
    selectedTags: ["Turkish"]);

Recipe r3 = Recipe(name: "kapama", description: "yemek", notes: "yap",
    selectedTags: ["Turkish"]);

Recipe r4 = Recipe(name: "kapama", description: "yemek", notes: "yap",
    selectedTags: ["Turkish"]);

List<Recipe> asianRecipes = [r1];
List<Recipe> breakfastRecipes = [r2];
List<Recipe> dinnerRecipes = [r3];
List<Recipe> dessertRecipes = [r4];
List<Recipe> turkishRecipes = [r1,r2,r3];
List<Recipe> indianRecipes = [r4];
List<Recipe> vegetarianRecipes = [r4];
List<Recipe> soupRecipes = [r1];
List<Recipe> saladRecipes = [r1];
List<Recipe> italianRecipes = [r1];
List<Recipe> lunchRecipes = [r1];





class TagsPage extends StatelessWidget {
  final List<String> tagList;

  const TagsPage({super.key, required this.tagList});

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
            crossAxisCount: 2,
            children: tagList.map((e) => TagsInList(tag: e)).toList(),
          ),
        ));
  }
}

class TagsInList extends StatelessWidget {
  TagsInList({Key? key, required this.tag}) : super(key: key);

  final String tag;
  List<Recipe> selectedRecipe = [];

List<Recipe> assignPage() {
  if(tag==listOfTags[0].toString()){
    selectedRecipe = asianRecipes;
    return selectedRecipe;
  }
  if(tag == listOfTags[1]){
    selectedRecipe = breakfastRecipes;
    return selectedRecipe;
  }
  if(tag == listOfTags[2]){
    selectedRecipe = dinnerRecipes;
    return selectedRecipe;
  }
  if(tag == listOfTags[3]){
    selectedRecipe = dessertRecipes;
    return selectedRecipe;
  }
  if(tag == listOfTags[4]){
    selectedRecipe = turkishRecipes;
    return selectedRecipe;
  }
  if(tag == listOfTags[5]){
    selectedRecipe = indianRecipes;
    return selectedRecipe;
  }if(tag == listOfTags[6]){
    selectedRecipe = vegetarianRecipes;
    return selectedRecipe;
  }
  if(tag == listOfTags[7]){
    selectedRecipe = saladRecipes;
    return selectedRecipe;
  }
  if(tag == listOfTags[8]){
    selectedRecipe = soupRecipes;
    return selectedRecipe;
  }if(tag == listOfTags[9]){
    selectedRecipe = italianRecipes;
    return selectedRecipe;
  }
  if(tag == listOfTags[10]){
    selectedRecipe = lunchRecipes;
    return selectedRecipe;
  }
  return [];

  }

  @override
  Widget build(BuildContext context) {
  selectedRecipe = assignPage();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DisplaySelection(recipes: turkishRecipes)),
          );
        },
        child: SizedBox(
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                tag,
                style: TextStyle(color: Colors.grey),
              ),
            ],
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
        ));
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




