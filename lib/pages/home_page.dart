import 'package:flutter/material.dart';
import 'package:corona_tracking/pages/about_page.dart';
import 'package:corona_tracking/pages/symptoms.dart';
import 'package:corona_tracking/pages/statistics.dart';
import 'package:corona_tracking/pages/news.dart';
import 'package:corona_tracking/widgets/colors.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    Symptoms(),
    Statistics(),
    AboutPage(),
    News(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          // _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
              activeColor: pink,
              inactiveColor: Theme.of(context).primaryColor),
          BottomNavyBarItem(
              title: Text('Statistics'),
              icon: Icon(Icons.insert_chart),
              activeColor: pink,
              inactiveColor: Theme.of(context).primaryColor),
          BottomNavyBarItem(
              title: Text('About'),
              icon: Icon(Icons.info),
              activeColor: pink,
              inactiveColor: Theme.of(context).primaryColor),
          BottomNavyBarItem(
              title: Text('News'),
              icon: Icon(Icons.chrome_reader_mode),
              activeColor: pink,
              inactiveColor: Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}
