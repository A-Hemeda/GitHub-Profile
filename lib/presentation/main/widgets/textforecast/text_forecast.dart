import 'package:flutter/material.dart';
import 'package:weather_algoriza/presentation/resources/font_manager.dart';
import 'package:weather_algoriza/presentation/resources/styles_manager.dart';

class TextForecast extends StatelessWidget {
  final String forecastText;

  const TextForecast({Key? key, required this.forecastText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Today\'s Temprature",
          style: getBoldStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Expected to be " + forecastText,
          style: getMediumStyle(
              color: Colors.grey.shade200, fontSize: FontSize.s16),
        )
      ],
    );
  }
}
