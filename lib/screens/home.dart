import 'package:amazon_prime/colors.dart';
import 'package:amazon_prime/widgets/HomeScreen.dart';
import 'package:amazon_prime/widgets/kids.dart';
import 'package:amazon_prime/widgets/movies.dart';
import 'package:amazon_prime/widgets/tvScreen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bg,
          title: Image.asset('images/primelogo.png',height: 25,),
          centerTitle: true,
          bottom: TabBar(
            indicatorWeight: 3,
            indicatorColor: white,
            tabs: [
              Tab(child: Text('Home')),
              Tab(child: Text('TV Shows')),
              Tab(child: Text('Movies')),
              Tab(child: Text('Kids')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            TVScreen(),
            Movies(),
            Kids(),
          ],
        ),
      ),
    );
  }
}
