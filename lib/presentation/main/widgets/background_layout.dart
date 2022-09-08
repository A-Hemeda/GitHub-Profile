import 'package:flutter/material.dart';
import 'package:weather_algoriza/network/weather_cubit/cubit/weather_cubit.dart';

class backGround_layout extends StatelessWidget {
  final Widget child;
  final bool isLight;
  const backGround_layout(
      {Key? key, required this.child, required this.isLight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: isLight
              ? LinearGradient(colors: [
                  Color.fromARGB(156, 93, 137, 226),
                  Color.fromARGB(156, 36, 137, 238)
                ], begin: Alignment.topCenter)
              : LinearGradient(
                  colors: [Colors.black, Colors.black],
                  begin: Alignment.topCenter)),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
