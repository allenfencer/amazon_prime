import 'package:amazon_prime/colors.dart';
import 'package:amazon_prime/screens/HomeScreen.dart';
import 'package:amazon_prime/screens/downloads.dart';
import 'package:amazon_prime/screens/find.dart';
import 'package:amazon_prime/screens/profile.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({Key key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int current_index=0;

  List screens=[
    HomeScreen(),
    Find(),
    Downloads(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: screens.elementAt(current_index),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bg,
        currentIndex: current_index,
        type:BottomNavigationBarType.fixed,
        iconSize: 25,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.blue[700],
        selectedIconTheme: IconThemeData(color: Colors.blue[600]),
        onTap: (index){
          setState(() {
            current_index=index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Find',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_sharp),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Stuff',
          ),
        ],
      ),
    );
  }
}
