import 'package:aetheris/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WeatherImage extends StatelessWidget {
  final int? conditionCode;
  final bool? isDay;

  const WeatherImage({
    super.key,
    this.conditionCode,
    this.isDay,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Image.asset(
        getWeatherConditionIcon(conditionCode, isDay),
        height: size.height * 0.3,
      ).animate().scaleXY(
          duration: const Duration(seconds: 2),
          begin: 0.0,
          end: 1,
          curve: Curves.easeInOut),
    );
  }
}