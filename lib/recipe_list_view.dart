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
  String min = "", hour = "", wholeTime = "";
  String generateTime(String pMin, String pHour, String pWholeTime) {

    pHour = pWholeTime.substring(0,2);
    pMin = pWholeTime.substring(2,4);
    pWholeTime = pHour + "Hours "+pMin+" Minutes ";
    pWholeTime = pHour + "Hours "+pMin+" Minutes ";
    return pWholeTime;
}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(
        widget.recipeList.length,
        (index) => Padding(
          padding: const EdgeInsets.all(0),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      RecipeInspect(
                          recipe: widget.recipeList[index])));
            },
            child: Row(
              children: [
                Expanded(
                  flex: 20,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "Assets/images/food1.jpg",
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
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
                                  const Padding(padding: EdgeInsets.all(20)),
                                  Text(
                                    //widget.recipeList[index].preparingTime,
                                    generateTime(min, hour, widget.recipeList[index].preparingTime),
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
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
