import 'package:corona_tracking/pages/about.dart';
import 'package:corona_tracking/pages/myths.dart';
import 'package:corona_tracking/widgets/colors.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  final tabs = <Tab>[
    Tab(
      text: 'About Corona',
    ),
    Tab(text: 'Myths'),
  ];

  final tabPages = [AboutCorona(), Myths()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: white,
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(controller: _tabController, children: tabPages),
    );
  }
}
