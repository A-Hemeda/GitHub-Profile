import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_algoriza/data/models/forecast_model.dart';
import 'package:weather_algoriza/presentation/resources/assets_manager.dart';
import 'package:weather_algoriza/presentation/resources/font_manager.dart';
import 'package:weather_algoriza/presentation/resources/styles_manager.dart';
import 'package:weather_algoriza/presentation/resources/values_manager.dart';

class DaysForecast extends StatelessWidget {
  final bool isLight;
  final List<ForecastModel> days;
  const DaysForecast({required this.days, Key? key, required this.isLight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          3,
          (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: DayForecastRow(
                  day: DateFormat("EEEE")
                      .format(DateFormat("yyyy-mm-dd").parse(days[index].date)),
                  max: days[index].max,
                  isLight: isLight,
                  min: days[index].min,
                  humidty: days[index].chanceOfRain,
                ),
              )),
    );
  }
}

class DayForecastRow extends StatelessWidget {
  final bool isLight;
  final String max, min, humidty, day;
  const DayForecastRow({
    Key? key,
    required this.isLight,
    required this.day,
    required this.max,
    required this.min,
    required this.humidty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          day,
          style: getSemiBoldStyle(color: Colors.white, fontSize: FontSize.s16),
        ),
        Spacer(),
        Icon(
          Icons.water_drop_sharp,
          color: isLight ? Colors.white : Colors.grey,
          size: AppSize.s12,
        ),
        Text(
          humidty.toString() + "%",
          style: getRegularStyle(),
        ),
        SizedBox(
          width: 10,
        ),
        Image.asset(
          ImageAssets.sunpng,
          height: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Image.asset(
          ImageAssets.moonpng,
          height: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          max.toString() + "°",
          style: getRegularStyle(),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          min.toString() + "°",
          style: getRegularStyle(),
        ),
      ],
    );
  }
}
