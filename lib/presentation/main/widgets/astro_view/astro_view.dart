import 'package:flutter/material.dart';
import 'package:weather_algoriza/data/models/forecast_model.dart';
import 'package:weather_algoriza/presentation/resources/assets_manager.dart';
import 'package:weather_algoriza/presentation/resources/font_manager.dart';
import 'package:weather_algoriza/presentation/resources/styles_manager.dart';
import 'package:weather_algoriza/presentation/resources/values_manager.dart';

class AstroView extends StatelessWidget {
  final AstroModel astroModel;
  const AstroView({Key? key, required this.astroModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
      child: Row(
        children: [
          AstroViewComponent(
            date: astroModel.sunrise!,
            state: true, //if sunrise
          ),
          Spacer(),
          AstroViewComponent(
            date: astroModel.sunset!,
            state: false,
          ),
        ],
      ),
    );
  }
}

class AstroViewComponent extends StatelessWidget {
  final String date;
  final bool state;

  const AstroViewComponent({
    Key? key,
    required this.date,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          state ? "Sunrise" : "Sunset",
          style: getRegularStyle(fontSize: FontSize.s14),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          date,
          style: getSemiBoldStyle(color: Colors.white, fontSize: FontSize.s14),
        ),
        Image.asset(
          state ? ImageAssets.sunrise : ImageAssets.sunsunset,
          height: AppSize.s120,
        )
      ],
    );
  }
}
