import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';
import 'package:zekr_app/Screens/HelperScreen.dart';
import 'package:zekr_app/Screens/HomeScreen.dart';
import 'hesnScreen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  final tabList = ['التسبيح', 'الذكر '];
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'بسم الله',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              color: Color(0xff003050)),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(15),
            child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Helper();
                      });
                },
                icon: Icon(
                  Icons.info_outlined,
                  color: Color(0xff003050),
                  size: 35,
                )),
          ),
        ],
        leading: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/7694743.png'),
              )),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Color(0xffFF090088),
          labelStyle: TextStyle(
            fontSize: 15,
          ),
          indicator: PointTabIndicator(
            position: PointTabIndicatorPosition.bottom,
            color: Color(0xffFF090088),
            insets: EdgeInsets.only(bottom: 6),
          ),
          tabs: tabList.map((item) {
            return Tab(
              text: item,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeScreen(),
          hesnScreen(),
        ],
      ),
    );
  }
}
