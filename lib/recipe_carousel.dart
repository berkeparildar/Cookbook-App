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
    myTimer.setSecond(widget.recipe.seconds);
    myTimer.setMinute(widget.recipe.minutes);
    myTimer.setHour(widget.recipe.hours);
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
          decoration: BoxDecoration(
            color: Colors.grey.shade800
          ),
          child:  ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey.shade800),
            ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        SimpleDialog(
                          title: Text("Timer"),
                          children: [myTimer],
                          backgroundColor: Colors.grey.shade700,
                          alignment: Alignment.center,

                        ));
              },
              child: Icon(Icons.timer)),
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
    List<String> arr = ['one', 'two', "three", "four"];
    final PageController controller = PageController();

    return PageView(
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      physics: const BouncingScrollPhysics(),
      controller: controller,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.grey.shade800),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Column(
                  children: [
                    const Icon(Icons.access_alarm_outlined),
                    const Padding(padding: EdgeInsets.all(4)),
                    Text('Prep: ${recipe.preparingTime}')
                  ],
                ),
              ),
              SizedBox(
                width: 120,
                height: 120,
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
                  width: 120,
                  height: 120,
                  child: Column(
                    children: [
                      const Icon(Icons.shopping_bag_outlined),
                      const Padding(padding: EdgeInsets.all(4)),
                      Text('${recipe.ingredients.length} ingredients')
                    ],
                  ),
                ),
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Column(
                    children: [
                      const Icon(Icons.restaurant),
                      const Padding(padding: EdgeInsets.all(4)),
                      Text('${recipe.name}')
                    ],
                  ),
                ),
              ],
            )
          ]),
        ),
        ...List<Widget>.generate(
            4,
            (index) => DecoratedBox(
                decoration: BoxDecoration(color: Colors.grey.shade800),
                child: Column(
                    children: [
                      Center(
                        child: Text('${index + 1}.'),
                      ),
                    ]))),
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
        hours: widget.timerHours,
        minutes: widget.timerMinutes,
        seconds: widget.timerSeconds);
    super.initState();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
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

    return Expanded(
        child: Center(
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
    ));
  }
}
