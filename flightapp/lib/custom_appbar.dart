import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];

  CustomAppBar() {
    bottomBarItems.add(BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.black,),
      title: Text("Explore", style: TextStyle(color: Colors.black))
    ));
    bottomBarItems.add(BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.black,),
      title: Text("Explore", style: TextStyle(color: Colors.black))
    ));
    bottomBarItems.add(BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.black,),
      title: Text("Explore", style: TextStyle(color: Colors.black))
    ));
    bottomBarItems.add(BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.black,),
      title: Text("Explore", style: TextStyle(color: Colors.black))
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bottomBarItems,
      type: BottomNavigationBarType.fixed,
    );
  }
}