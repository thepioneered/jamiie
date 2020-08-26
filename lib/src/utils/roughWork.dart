import 'package:Jamiie/src/screens/adminPool/creatPool.dart';
import 'package:flutter/material.dart';

class Rough extends StatefulWidget {
  @override
  _RoughState createState() => _RoughState();
}

class _RoughState extends State<Rough> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GrubX"),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: [
            Tab(
              text: "Joined Pools",
            ),
            Tab(
              text: "Created Pools",
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [
          CreatePoolPage(),
          new Text("This is chat Tab View"),
        ],
        controller: _tabController,
      ),
    );
  }
}
