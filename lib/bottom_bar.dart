import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
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
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
            print(index);
          });
        },
      ),
    );
  }
}
