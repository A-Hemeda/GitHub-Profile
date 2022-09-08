class LocationModel {
  late final String name, region, country;

  late double lat, lon;
  LocationModel.fromMap(Map<String, dynamic> map) {
    name = map["name"];
    region = map["region"];
    country = map["country"];
    lat = map["lat"];
    lon = map["lon"];
  }
}


