import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_algoriza/app/helpers/cash_helper.dart';
import 'package:weather_algoriza/data/models/weather_data_model.dart';

import 'package:weather_algoriza/network/api/api_services.dart';
import 'package:weather_algoriza/network/api/end_points.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.locations, required this.temps})
      : super(WeatherInitial());
  List<String> locations = [];
  List<String> temps = [];

  WeatherDataModel? weatherData;
  bool isLight = true;
  bool _appBarCollapsed = false;

  changeLight() {
    isLight = !isLight;
    emit(IsLightStateChanged());
  }

  changeAppBarCollapsed() {
    _appBarCollapsed = !_appBarCollapsed;
    emit(IsLightStateChanged());
  }

  static WeatherCubit get(BuildContext context) => BlocProvider.of(context);
  getData() async {
    emit(WeatherDataLoading());
    DioHelper.getData(url: EndPoints.forecast, quiry: {
      'key': '3abc4ac71f114deb86380405201809',
      'q': 'Cairo',
      'days': 7,
      'aqi': 'no',
      'alerts': 'no',
    }).then((value) {
      weatherData = WeatherDataModel.fromMap(value.data);
      print("---------------" + weatherData!.location!.country);
      emit(WeatherGetDataSuccess());
    }).catchError((e) {
      print(e);
      emit(WeatherGetDataError());
    });
  }

  String countryValue = "Egypt";
  String states = "Cairo";
  String city = "Egypt";

  changeState(String value) {
    states = value;
    emit(WeatherStatesChanged());
  }

  changeCity(String value) {
    city = value;
    emit(WeatherCityChanged());
  }

  changeCountry(String value) {
    countryValue = value;
    emit(WeatherCountryChanged());
  }

  bool managemntBoardopened = false;
  changeBoard() {
    managemntBoardopened = !managemntBoardopened;
    emit(WeatherCityChanged());
  }

  ManageLocationData() async {
    managemntBoardopened = !managemntBoardopened;
    DioHelper.getData(url: EndPoints.forecast, quiry: {
      'key': '3abc4ac71f114deb86380405201809',
      'q': city,
      'days': 7,
      'aqi': 'no',
      'alerts': 'no',
    }).then((value) {
      weatherData = WeatherDataModel.fromMap(value.data);
      AddAnotherLocation(city, weatherData!.current!.temp_c);
      print("---------------" + weatherData!.location!.country);
      emit(WeatherGetDataSuccess());
    }).catchError((e) {
      print(e);
      emit(WeatherGetDataError());
    });
  }

  //add Favourity Location
  AddAnotherLocation(city, temp) {
    locations.add(city);
    temps.add(temp.toString());

    CashHelper.setData(key: "locations", value: locations);
    CashHelper.setData(key: "temps", value: temps);

    emit(WeatherCityChanged());
  }
}
