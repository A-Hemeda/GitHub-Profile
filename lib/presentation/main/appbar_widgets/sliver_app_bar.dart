import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:weather_algoriza/network/weather_cubit/cubit/weather_cubit.dart';
import 'package:weather_algoriza/presentation/main/appbar_widgets/appbar_title.dart';
import 'package:weather_algoriza/presentation/resources/assets_manager.dart';
import 'package:weather_algoriza/presentation/resources/size_config.dart';
import 'package:weather_algoriza/presentation/resources/styles_manager.dart';

import 'flixable_space.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String temp, place, feelsLike, day, time, maxTemp, minTemp;
  final bool isCollapsed;
  final bool isLight;
 final GlobalKey<SideMenuState> sideMenuKey ;
  const CustomSliverAppBar(
      {Key? key,
      required this.sideMenuKey,
      required this.day,
      required this.isLight,
      required this.isCollapsed,
      required this.feelsLike,
      required this.maxTemp,
      required this.minTemp,
      required this.place,
      required this.temp,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      collapsedHeight: SizeConfig.screenHeight * 0.3,
      title: AppbarTitle(isCollapsed: isCollapsed, place: place,sideMenuKey:sideMenuKey),
      expandedHeight: SizeConfig.screenHeight * 0.4,
      pinned: true,
      elevation: 0,
      backgroundColor: isLight ? Colors.transparent : Colors.black,
      flexibleSpace: FlexibleSpace(
          isCollapsed: isCollapsed,
          temp: temp,
          maxTemp: maxTemp,
          minTemp: minTemp,
          day: day,
          time: time,
          place: place,
          feelsLike: feelsLike),
    );
    //top
  }
}
