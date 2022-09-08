class CurrentWeatherModel {
  late final double temp_c, feelslike_c;
  late final String uvIndex, wind, humidty;
  late ConditionModel condition;

  CurrentWeatherModel.fromMap(Map<String, dynamic> map) {
    temp_c = map["temp_c"];
    uvIndex = map["uv"].toString();
    wind = map["wind_kph"].toString();
    humidty = map["humidity"].toString();
    feelslike_c = map["feelslike_c"];
    condition = ConditionModel.fromMap(map["condition"]);
  }
}

class ConditionModel {
  late final String conditionText;
  late final String icon;

  ConditionModel.fromMap(Map<String, dynamic> map) {
    conditionText = map["text"];
    icon = map["icon"];
  }
}
