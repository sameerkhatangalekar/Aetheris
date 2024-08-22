import 'package:aetheris/core/theme/theme.dart';
import 'package:aetheris/features/home/domain/entity/weather_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PredictionsData extends StatelessWidget {
  final ForecastDayEntity? _forecastDayEntity;

  const PredictionsData({
    super.key,
    ForecastDayEntity? forecastDayEntity,
  }) : _forecastDayEntity = forecastDayEntity;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade900.withOpacity(0.5),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: size.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icons/502.png',
                        height: 48,
                        width: 48,
                        fit: BoxFit.scaleDown,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Rain Chances\n',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Palette.subTitleColor),
                          children: [
                            TextSpan(
                              text:
                              '${_forecastDayEntity?.day?.dailyChanceOfRain?.toString()}%',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                  width: size.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/601.png',
                        height: 48,
                        width: 48,
                        fit: BoxFit.scaleDown,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Snow Chances\n',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Palette.subTitleColor),
                          children: [
                            TextSpan(
                              text:
                              '${_forecastDayEntity?.day?.dailyChanceOfSnow?.toString()}%',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),

        ],
      ).animate().fadeIn(
          duration: const Duration(seconds: 2),
          begin: 0,
          curve: Curves.easeInOut),
    );
  }
}
