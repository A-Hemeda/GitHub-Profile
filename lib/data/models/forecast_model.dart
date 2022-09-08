import 'package:weather_algoriza/data/models/current_weather_model.dart';

class ForecastModel {
  late String date;
  late String max;
  late String min;
  late String chanceOfRain;
  late AstroModel astro;
  late ConditionModel condition;
  List<Hour> hours = [];
  ForecastModel.fromMap(Map<String, dynamic> map) {
    date = map["date"];
    max = map["day"]["maxtemp_c"].toString();
    min = map["day"]["mintemp_c"].toString();
    astro = AstroModel.fromJson(map["astro"]);
    chanceOfRain = map["day"]["daily_chance_of_rain"].toString();

    condition = ConditionModel.fromMap(map["day"]["condition"]);

    map["hour"].forEach((hourMap) {
      hours.add(Hour.fromMap(hourMap));
    });
  }
}

class AstroModel {
  String? sunrise;
  String? sunset;
  String? moonPhase;
  AstroModel({
    this.sunrise,
    this.sunset,
    this.moonPhase,
  });

  AstroModel.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonPhase = json['moon_phase'];
  }
}

class Hour {
  String? time;
  int? timeEpoch;
  double? tempC;
  double? tempF;
  ConditionModel? condition;
  double? windMph;
  double? windKph;

  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;

  Hour.fromMap(Map<String, dynamic> json) {
    timeEpoch = json['time_epoch'];
    time = json['time'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    condition = ConditionModel.fromMap(json['condition']);

    windMph = json['wind_mph'];
    windKph = json['wind_kph'];

    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    windchillC = json['windchill_c'];
    windchillF = json['windchill_f'];
    heatindexC = json['heatindex_c'];
    heatindexF = json['heatindex_f'];
    dewpointC = json['dewpoint_c'];
    dewpointF = json['dewpoint_f'];
    willItRain = json['will_it_rain'];
    chanceOfRain = json['chance_of_rain'];
    willItSnow = json['will_it_snow'];
    chanceOfSnow = json['chance_of_snow'];
  }
}
