import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interior_design_app/src/utils/my_colors.dart';
import 'package:interior_design_app/src/views/screens/bottom_navigation/bottom_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: fPrimaryColor,
          primaryColor: fPrimaryColor,
          scaffoldBackgroundColor: Colors.white),
      home: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,

        // rebuildFactor: (MediaQueryData old, MediaQueryData data){
        //   return false ;
        // },
        builder: (child, context) {
          return BottomNavigationScreen();
        },
      ),
    );
  }
}
