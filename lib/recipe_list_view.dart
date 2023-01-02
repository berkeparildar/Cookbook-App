import 'package:flutter/material.dart';
import 'package:se380_project/main.dart';
import 'package:se380_project/recipe.dart';
import 'package:se380_project/recipe_inspect.dart';

class RecipeListView extends StatefulWidget {
  const RecipeListView({Key? key, required this.recipeList}) : super(key: key);
  final List<Recipe> recipeList;
  @override
  State<RecipeListView> createState() => _RecipeListViewState();
}

class _RecipeListViewState extends State<RecipeListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(widget.recipeList.length, (index) => Padding(
      padding: const EdgeInsets.all(0),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RecipeInspect(
                recipe: MyHomePage.getRecipes()[index],
              )));
        },
        child: Row(
          children: [
            Expanded(
              flex: 20,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "Assets/images/food1.jpg",
                      ),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                    ),
              ),
            ),
            Expanded(
                flex: 80,
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.recipeList[index].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.recipeList[index].cookingTime,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,

                                ),
                              ),
                              const Icon(
                                Icons.restaurant,
                                color: Colors.white,
                                size: 12,
                              ),
                              const Padding(padding: EdgeInsets.all(20)
                              ),
                              Text(
                                widget.recipeList[index].preparingTime,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              const Icon(
                                Icons.restaurant_menu_sharp,
                                color: Colors.white,
                                size: 12,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                )
            )
          ],
        ),
      ),
    ),
    ),
    );
  }
}
