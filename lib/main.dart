import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_algoriza/app/helpers/cash_helper.dart';
import 'package:weather_algoriza/network/api/api_services.dart';
import 'package:weather_algoriza/network/weather_cubit/cubit/weather_cubit.dart';
import 'package:weather_algoriza/presentation/resources/routes_manager.dart';
import 'package:weather_algoriza/presentation/resources/theme_manager.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  DioHelper();
  await CashHelper.initCashHelper();
  final List<String> mylocations = CashHelper.getData("locations") ??const [];
    final List<String> myTemps = CashHelper.getData("temps") ??const [];

  runApp( MyApp(locations: mylocations,temps: myTemps,));
}

class MyApp extends StatelessWidget {
  final List<String> ?locations;
    final List<String> ?temps;

  const MyApp({Key? key,required this.locations,required this.temps}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(locations: locations!,temps: temps!)..getData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        onGenerateRoute: RouteGenerator.getRoute,
        theme: getApplicationTheme(),
      ),
    );
  }
}
