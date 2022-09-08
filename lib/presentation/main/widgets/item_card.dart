import 'package:flutter/material.dart';
import 'package:weather_algoriza/presentation/resources/size_config.dart';
import 'package:weather_algoriza/presentation/resources/values_manager.dart';

class ItemBackground extends StatelessWidget {
  final Widget child;
  final bool isLight;

  const ItemBackground({Key? key, required this.child, required this.isLight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
                color: isLight ? Colors.blue.shade50 : Colors.black26),
            color:
                isLight ? Colors.white.withOpacity(0.2) : Colors.grey.shade900,
            borderRadius: BorderRadius.circular(AppSize.s20)),
        child: child);
  }
}
