import 'package:flutter/material.dart';
import 'recipe.dart';

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
  const TagsInList({Key? key, required this.tag}) : super(key: key);

  final String tag;

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
              Text(tag,
              style: TextStyle(color: Colors.grey),),
            ],
          ),
        ),
      ),
    );
  }
}

void nvigateToPage() {

}
