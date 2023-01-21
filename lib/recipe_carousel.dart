import 'dart:async';

import 'package:flutter/material.dart';
import 'package:se380_project/recipe.dart';

import 'main.dart';

class RecipeCarousel extends StatefulWidget {
  const RecipeCarousel({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  State<RecipeCarousel> createState() => _RecipeCarouselState();
}

class _RecipeCarouselState extends State<RecipeCarousel> {
  @override
  Widget build(BuildContext context) {
    MyTimer myTimer = MyTimer(timerSeconds: 0, timerHours: 0, timerMinutes: 0);

    String generateHour(String pHour, String pWholeTime) {
      List<String> arr = pWholeTime.split(":");
      pHour = arr[0];
      return pHour;
    }

    String generateMin(String pMin, String pWholeTime) {
      List<String> arr = pWholeTime.split(":");
      pMin = arr[1];
      return pMin;
    }

    String hour = "", min = "";

    hour = generateHour(hour, widget.recipe.cookingTime);
    min = generateMin(min, widget.recipe.cookingTime);
    myTimer.setSecond(0);
    //myTimer.setMinute(widget.recipe.minutes);
    //myTimer.setHour(widget.recipe.hours);
    myTimer.setMinute(int.parse(min));
    myTimer.setHour(int.parse(hour));
    return MaterialApp(
      theme: ThemeData(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.grey.shade800),
      home: Scaffold(
        appBar: AppBar(
          leading: TextButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              });
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.grey.shade800,
          title: const Text("CookBook"),
          titleTextStyle: const TextStyle(
            fontFamily: "DancingScript",
            fontSize: 35,
          ),
          centerTitle: true,
        ),
        body: CarouselPage(recipe: widget.recipe),
        bottomNavigationBar: DecoratedBox(
          decoration: BoxDecoration(color: Colors.grey.shade800),
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.grey.shade800),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => SimpleDialog(
                          title: const Text("Timer"),
                          backgroundColor: Colors.grey.shade700,
                          alignment: Alignment.center,
                          children: [myTimer],
                        ));
              },
              child: const Icon(Icons.timer)),
        ),
      ),
    );
  }
}

class CarouselPage extends StatelessWidget {
  const CarouselPage({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    List<String> methods = recipe.method.split("*");
    List<String> ingredients = recipe.ingredients.split("+");
    final PageController controller = PageController();

    return PageView(
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      physics: const BouncingScrollPhysics(),
      controller: controller,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.grey.shade800),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 180,
                  height: 180,
                  child: Column(
                    children: [
                      const Icon(Icons.access_alarm_outlined),
                      const Padding(padding: EdgeInsets.all(4)),
                      Text('Prep: ${recipe.preparingTime}')
                    ],
                  ),
                ),
                SizedBox(
                  width: 180,
                  height: 180,
                  child: Column(
                    children: [
                      const Icon(Icons.present_to_all),
                      const Padding(padding: EdgeInsets.all(4)),
                      Text('Cook: ${recipe.cookingTime}')
                    ],
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: Column(
                      children: [
                        const Icon(Icons.shopping_bag_outlined),
                        const Padding(padding: EdgeInsets.all(4)),
                        Text('${ingredients.length} ingredients')
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: Column(
                      children: [
                        const Icon(Icons.restaurant),
                        const Padding(padding: EdgeInsets.all(4)),
                        Text(recipe.name)
                      ],
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
        ...List<Widget>.generate(
            methods.length,
            (index) => DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey.shade800),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${index + 1}.',
                          style: const TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        const Padding(padding: EdgeInsets.all(6)),
                        Text(methods[index],
                        softWrap: true,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),),
                      ]),
                ))),
      ],
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

  MyTimer(
      {super.key,
      required this.timerSeconds,
      required this.timerMinutes,
      required this.timerHours});

  @override
  State<StatefulWidget> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  Timer? countdownTimer;
  Duration myDuration = const Duration(hours: 0, minutes: 0, seconds: 0);

  @override
  void initState() {
    myDuration = Duration(
        hours: widget.timerHours, minutes: widget.timerMinutes, seconds: 0);
    super.initState();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSec = 1;
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
      myDuration = Duration(
          hours: widget.timerHours,
          minutes: widget.timerMinutes,
          seconds: widget.timerSeconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            '$hours:$minutes:$seconds',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 50),
          ),
          const SizedBox(
            height: 1,
          ),
          ElevatedButton(
            onPressed: startTimer,
            child: const Text(
              'Start',
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
            child: const Text(
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
              child: const Text(
                'Reset',
                style: TextStyle(
                  fontSize: 30,
                ),
              ))
        ],
      ),
    );
  }
}
