import 'package:flutter/material.dart';
import 'package:se380_project/add_recipe.dart';
import 'package:se380_project/my_recipes.dart';
import 'package:se380_project/tags.dart';
import 'package:se380_project/recipe.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key, required this.selectedIndex}) : super(key: key);
  int selectedIndex;
  @override
  State<BottomBar> createState() => _BottomBarState();
}
List<String> tags = AddRecipePage.getTags();

class _BottomBarState extends State<BottomBar> {

  List<Widget> widList = [
    MyRecipes(
      recipeList: [r1, r2, r3, r4],
      selectedIndex: 0,
  ),
    Text("data"),
    TagsPage(
        tagList: tags,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
              label: "All",
              icon: Icon(Icons.menu_book_outlined)
          ),
          BottomNavigationBarItem(
              label: "Favorites",
              icon: Icon(Icons.favorite_border)
          ),
          BottomNavigationBarItem(
              label: "Tags",
              icon: Icon(Icons.receipt_long)
          )
        ],
        currentIndex: widget.selectedIndex,
        onTap: (int index) {
          setState(() {
            widget.selectedIndex = index;
            print(index);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => widList[index],));
          });
        },
      ),
    );
  }
}
