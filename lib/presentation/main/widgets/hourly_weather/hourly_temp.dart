import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:weather_algoriza/data/models/forecast_model.dart';
import 'package:weather_algoriza/presentation/main/widgets/hourly_weather/hourly_temp_top.dart';
import 'package:weather_algoriza/presentation/resources/styles_manager.dart';

class DropsRow extends StatelessWidget {
  final List<Hour> hours;
  const DropsRow({
    Key? key,
    required this.hours,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        height: 50,
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.zero,
        child: Row(
            children: List.generate(
                24,
                (index) => SizedBox(
                      width: 55,
                      height: 50,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.water_drop_rounded,
                            color: Colors.grey.shade100.withOpacity(0.6),
                          ),
                          Text(
                            hours[index].chanceOfRain.toString() + "%",
                            style: getRegularStyle(),
                          )
                        ],
                      ),
                    ))));
  }
}

class Weatherchart extends StatelessWidget {
  final List<Hour> hours;

  const Weatherchart({
    required this.hours,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 99,
      child: SfSparkLineChart(
        color: Colors.white,
        trackball: SparkChartTrackball(
            width: 2,
            backgroundColor: Colors.black12.withOpacity(0.5),
            borderWidth: 1,
            tooltipFormatter: (details) => " ${details.label}°C",
            hideDelay: 1,
            borderColor: Colors.white,
            labelStyle: getRegularStyle(),
            activationMode: SparkChartActivationMode.longPress),
        marker: SparkChartMarker(
            size: 3, displayMode: SparkChartMarkerDisplayMode.all),
        axisLineColor: Colors.transparent,
        data: List.generate(24, (index) => hours[index].tempC!),
      ),
    );
  }
}

class HourlyTempRow extends StatelessWidget {
  final List<Hour> hours;

  const HourlyTempRow({Key? key, required this.hours}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        child: Row(
            children: List.generate(24, (index) {
          //TODO: Extract this function
          DateTime prevFormat =
              DateFormat("yyyy-mm-dd hh:mm").parse(hours[index].time!);

          return HourlyTemp(
              hour: DateFormat("h:mm a").format(prevFormat),
              temp: hours[index].tempC.toString());
        })));
  }
}
