part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherGetDataSuccess extends WeatherState {}

class WeatherDataLoading extends WeatherState {}

class WeatherGetDataError extends WeatherState {}

class IsLightStateChanged extends WeatherState{}
class WeatherCityChanged extends WeatherState {}
class WeatherStatesChanged extends WeatherState {}
class WeatherCountryChanged extends WeatherState {}
