import 'dart:io';

import 'package:flutter/material.dart';
import 'package:interior_design_app/src/models/bottom_navigator_item.dart';
import 'package:interior_design_app/src/views/components/bottom_navigation.dart';
import 'package:interior_design_app/src/views/screens/bottom_navigation/screens/home_page.dart';



class BottomNavigationScreen extends StatefulWidget {
  @override
  _MainScreenBodyState createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<BottomNavigationScreen> {

  @override
  void initState() {
    super.initState();


  }
   @override
   void dispose() {
     // TODO: implement dispose
     super.dispose();
   }

  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  bool _isDoubleClickToExit = false;

  Future<bool> _onWillPop() async {

    _scaffoldState.currentState.hideCurrentSnackBar();
    if (!_isDoubleClickToExit) {
      _scaffoldState.currentState.showSnackBar(const SnackBar(
          content: Text(
        'ExitApp',
      )));
      _isDoubleClickToExit = true;
      return false;
    } else {
      exit(0);
      return true;
    }
  }
     PageController pageController;

   int _current=0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldState,
          body: BottomNavigationPage(


            items: [
              const BottomNavigationItem(
                title:  'Home',
                icon:Icons.home,page: HomePageScreen(),
              ),
              BottomNavigationItem(
                title:  'Gallery',
                icon:Icons.wallpaper,page: Container(),
              ),
              BottomNavigationItem(
                title:  'My Services',
                icon:Icons.business_center,page: Container(),
              ),
              BottomNavigationItem(
                title:  'My requests',
                icon:Icons.shopping_cart,page: Container(),
              ),
              BottomNavigationItem(
                title:  'Profile',
                icon:Icons.person,page: Container(),
              ),
            ],
          )



      ),
    );
  }

}
