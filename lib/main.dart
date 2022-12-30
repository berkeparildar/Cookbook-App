import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(250, 40),
            backgroundColor: Colors.grey.shade800,
          )
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 40,
              child: Center(
                  child: Text(
                      "COOKBOOK",
                    style: TextStyle(
                      fontFamily: "DancingScript",
                      fontSize: 55
                    ),
                  )
              ),
            ),
            Expanded(
              flex: 60,
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Add recipe"),
                          Icon(Icons.add),
                        ],
                      ),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("My Recipes"),
                          Icon(Icons.search
                          ),
                        ],
                      ),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Favourites"),
                          Icon(Icons.favorite),
                        ],
                      ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
