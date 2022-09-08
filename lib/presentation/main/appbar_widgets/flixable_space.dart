import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import '../../resources/styles_manager.dart';

class FlexibleSpace extends StatelessWidget {
  const FlexibleSpace({
    Key? key,
    required this.isCollapsed,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.day,
    required this.time,
    required this.place,
    required this.feelsLike,
  }) : super(key: key);

  final bool isCollapsed;
  final String temp;
  final String maxTemp;
  final String minTemp;
  final String day;
  final String time;
  final String place;
  final String feelsLike;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      titlePadding: EdgeInsets.all(20),
      title: isCollapsed
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  temp + "°",
                  style: getLightStyle(
                    fontSize: 60,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "$maxTemp° / $minTemp°\n$day , $time",
                  style: getSemiBoldStyle(
                    fontSize: 15,
                    color: Colors.grey.shade100,
                  ),
                ),
                Spacer(),
                Image.asset(
                  ImageAssets.sungif,
                  height: 100,
                )
              ],
            )
          : null,
      expandedTitleScale: 500,
      collapseMode: CollapseMode.none,
      background: Container(
        margin: EdgeInsets.only(left: 0),
        height: 150,
        child: SpaceBody(
            temp: temp,
            place: place,
            maxTemp: maxTemp,
            minTemp: minTemp,
            feelsLike: feelsLike,
            day: day,
            time: time),
        color: Colors.transparent,
      ),
    );
  }
}

class SpaceBody extends StatelessWidget {
  const SpaceBody({
    Key? key,
    required this.temp,
    required this.place,
    required this.maxTemp,
    required this.minTemp,
    required this.feelsLike,
    required this.day,
    required this.time,
  }) : super(key: key);

  final String temp;
  final String place;
  final String maxTemp;
  final String minTemp;
  final String feelsLike;
  final String day;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              temp + "°",
              style: getLightStyle(
                fontSize: 46,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Text(
                  place,
                  style: getRegularStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.location_on_sharp, color: Colors.white),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "$maxTemp° / $minTemp° feels like $feelsLike°\n$day , $time",
              style: getSemiBoldStyle(
                fontSize: 15,
                color: Colors.grey.shade100,
              ),
            ),
          ],
        ),
        Image.asset(
          ImageAssets.sungif,
          height: 100,
        )
      ],
    );
  }
}
