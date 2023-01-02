import 'package:flutter/material.dart';
import 'package:se380_project/add_recipe.dart';
import 'package:se380_project/my_recipes.dart';
import 'package:se380_project/tags.dart';
import 'package:se380_project/favorites_page.dart';
import 'package:se380_project/recipe.dart';

import 'main.dart';


class BottomBar extends StatefulWidget {
  BottomBar({Key? key, required this.selectedIndex, required this.isInAddRecipe}) : super(key: key);
  final bool isInAddRecipe;
  int selectedIndex;
  @override
  State<BottomBar> createState() => _BottomBarState();
}
List<String> tags = AddRecipePage.getTags();
List<String> menuTags = ["All", "Favorites", "Tags"];
List<Icon> menuIcons = [const Icon(Icons.menu_book_sharp), const Icon(Icons.favorite_border), const Icon(Icons.receipt_long)];
List<String> addTags = ["About", "Ingredients", "Method"];
List<Icon> recipeIcons = [const Icon(Icons.newspaper), const Icon(Icons.shopping_bag_outlined), const Icon(Icons.format_list_bulleted)];
List<Widget> menuWidgetList = [
  MyRecipes(
    recipeList: MyHomePage.getRecipes(),
    selectedIndex: 0,
  ),
  FavoritesPage(
    recipeList: MyHomePage.getRecipes(),
    selectedIndex: 1,
  ),
  TagsPage(
    tagList: tags,
    selectedIndex: 2,
  )
];

List<Widget> recipeWidgets = [
  AddRecipePage(),
  //IngredientsPage(),
  Text("data"),
  Text("data")

];
class _BottomBarState extends State<BottomBar> {
  
  List<String> checkLocation(bool b){
    List<String> toReturn = [];
    if (b){
      toReturn = addTags;
    }
    else{
      toReturn = menuTags;
    }
    return toReturn;
  }

  List<Icon> checkLocationIcon(bool b){
    List<Icon> toReturn = [];
    if (b){
      toReturn = recipeIcons;
    }
    else{
      toReturn = menuIcons;
    }
    return toReturn;
  }

  List<Widget> checkDirection(bool b){
    List<Widget> widList = [];
    if (b){
      widList = recipeWidgets;
    }
    else{
      widList = menuWidgetList;
    }
    return widList;
  }

  

  @override
  Widget build(BuildContext context) {
  
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.white,
          width: 2
          ),
        )
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.grey.shade900,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: checkLocation(widget.isInAddRecipe)[0],
              icon: checkLocationIcon(widget.isInAddRecipe)[0],
          ),
          BottomNavigationBarItem(
              label: checkLocation(widget.isInAddRecipe)[1],
              icon: checkLocationIcon(widget.isInAddRecipe)[1],
          ),
          BottomNavigationBarItem(
              label: checkLocation(widget.isInAddRecipe)[2],
              icon: checkLocationIcon(widget.isInAddRecipe)[2],
          )
        ],
        currentIndex: widget.selectedIndex,
        onTap: (int index) {
          setState(() {
            widget.selectedIndex = index;
            print(index);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => checkDirection(widget.isInAddRecipe)[index],));
          });
        },
      ),
    );
  }
}
