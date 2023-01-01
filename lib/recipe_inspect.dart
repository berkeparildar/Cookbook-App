import 'package:flutter/material.dart';

class RecipeInspect extends StatefulWidget {
  const RecipeInspect({Key? key}) : super(key: key);

  @override
  State<RecipeInspect> createState() => _RecipeInspectState();
}

class _RecipeInspectState extends State<RecipeInspect> {
  List<String> arr = ["Breakfast ", "Healthy ", "Lunch "];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: const Text("CookBook"),
        titleTextStyle: const TextStyle(
          fontFamily: "DancingScript",
          fontSize: 35,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image(
            image: AssetImage("Assets/images/food1.jpg"),
          ),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.shade800
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 4
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Recipe Name",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: TextButton(
                            onPressed: () {}, 
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.blueGrey,
                            ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(24),
            child: Row(
              children: const [
                Expanded(
                  flex: 50,
                    child: Center(
                      child: Text(
                        "1 serve",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),
                      ),
                    )
                ),
                Expanded(
                  flex: 50,
                    child: Center(
                      child: Text(
                        "Prep: 5 mins",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
          Center(
            child: Text(
              "Cook: 5 mins",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(12),
            child: Text(
              textAlign: TextAlign.center,
              "Perfect healthy breakfast for easy mornings. Acai bowls are essentialy thick smoothie bowls loaded with toppings - yum!",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
          Wrap(
            children: List<Widget>.generate(arr.length, (index) => Text(
                arr[index] + " ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            ),
          )
        ],
      ),
    );
  }
}
