import 'dart:async';

import 'package:flutter/material.dart';
import 'package:se380_project/favorites_page.dart';
import 'package:se380_project/recipe.dart';
import 'package:se380_project/recipe_carousel.dart';

import 'main.dart';

class RecipeInspect extends StatefulWidget {
  const RecipeInspect({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  State<RecipeInspect> createState() => _RecipeInspectState();
}

class _RecipeInspectState extends State<RecipeInspect> {
  void checkFavorite(List<Recipe> arr) {
    if (widget.recipe.isFavorite != true) {
      widget.recipe.isFavorite = true;
      for (int i = 0; i < arr.length; i++) {
        if (arr[i] == widget.recipe) {
          arr[i].isFavorite = true;
        }
      }
    } else {
      widget.recipe.isFavorite = false;
      for (int i = 0; i < arr.length; i++) {
        if (arr[i] == widget.recipe) {
          arr[i].isFavorite = false;
        }
      }
    }
  }

  Icon getIcon(bool a) {
    Icon x = Icon(Icons.add);
    if (a) {
      x = Icon(Icons.favorite);
    } else {
      x = Icon(Icons.favorite_border);
    }
    return x;
  }

  List<String> arr = ["Breakfast ", "Healthy ", "Lunch "];
  MyTimer myTimer = MyTimer(timerSeconds: 0, timerHours: 0, timerMinutes: 0);

  @override
  Widget build(BuildContext context) {
    myTimer.setSecond(widget.recipe.seconds);
    myTimer.setMinute(widget.recipe.minutes);
    myTimer.setHour(widget.recipe.hours);

    String prepTime = widget.recipe.preparingTime;
    String cookTime = widget.recipe.cookingTime;
    Icon someIcon = getIcon(widget.recipe.isFavorite);
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
        actions: [
          TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                setState(() {
                  checkFavorite(MyHomePage.getRecipes());
                  someIcon = getIcon(widget.recipe.isFavorite);
                });
              },
              child: someIcon),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Image(
              image: AssetImage("Assets/images/food1.jpg"),
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey.shade800),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          widget.recipe.name,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RecipeCarousel(recipe: widget.recipe)));
                            },
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
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  const Expanded(
                      flex: 50,
                      child: Center(
                        child: Text(
                          "1 serve",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )),
                  Expanded(
                      flex: 50,
                      child: Center(
                        child: Text(
                          ("Prep: $prepTime"),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Center(
              child: Text(
                "Cook: $cookTime",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                textAlign: TextAlign.center,
                widget.recipe.description,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Wrap(
              children: List<Widget>.generate(
                widget.recipe.selectedTags.length,
                (index) => Text(
                  widget.recipe.selectedTags[index] + " ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   child: myTimer,
            //   height: 250,
            //   width: double.infinity,
            // ),
          ],
        ),
      ),
    );
  }
}

class MyTimer extends StatefulWidget {
  int timerSeconds;
  int timerMinutes;
  int timerHours;

  void setSecond(int pSecond) {
    timerSeconds = pSecond;
  }
  void setMinute(int pMinute) {
    timerMinutes = pMinute;
  }
  void setHour(int pHour) {
    timerHours = pHour;
  }

   MyTimer({super.key, required this.timerSeconds, required this.timerMinutes,
   required this.timerHours});

  @override
  State<StatefulWidget> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  Timer? countdownTimer;
  Duration myDuration = Duration(hours: 0, minutes: 0, seconds: 0);

  @override
  void initState() {
    myDuration = Duration(hours: widget.timerHours,minutes: widget.timerMinutes,
    seconds: widget.timerSeconds);
    super.initState();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSec = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSec;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      myDuration = Duration(hours: widget.timerHours,minutes: widget.timerMinutes,
          seconds: widget.timerSeconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Expanded(
        child: Center(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            '$hours:$minutes:$seconds',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 50),
          ),
          SizedBox(
            height: 1,
          ),
          ElevatedButton(
            onPressed: startTimer,
            child: Text(
              'start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (countdownTimer == null || countdownTimer!.isActive) {
                stopTimer();
              }
            },
            child: Text(
              'Stop',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                resetTimer();
              },
              child: Text(
                'Reset',
                style: TextStyle(
                  fontSize: 30,
                ),
              ))
        ],
      ),
    ));
  }
}
