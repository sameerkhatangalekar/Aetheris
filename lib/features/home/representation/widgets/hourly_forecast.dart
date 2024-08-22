import 'package:aetheris/core/theme/theme.dart';
import 'package:aetheris/core/utils/extension.dart';
import 'package:aetheris/core/utils/helpers.dart';
import 'package:aetheris/features/home/domain/entity/weather_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HourlyForecast extends StatelessWidget {
  final ForecastDayEntity? _forecastDayEntity;

  const HourlyForecast({
    super.key,
    ForecastDayEntity? forecastDayEntity,
  }) : _forecastDayEntity = forecastDayEntity;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 210,

      padding: const EdgeInsets.symmetric(vertical:  12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Hourly forecast",
            style: textTheme.titleMedium?.copyWith(
              color: Palette.subTitleColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.separated(
              itemCount:_forecastDayEntity == null || _forecastDayEntity.hour == null || _forecastDayEntity.hour!.isEmpty
                  ? 1
                  : _forecastDayEntity.hour!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (_forecastDayEntity == null || _forecastDayEntity.hour == null || _forecastDayEntity.hour!.isEmpty) {
                  return const Center(
                      child: Text('No forecast data available'));
                }
                final hourData = _forecastDayEntity.hour?[index];
                return Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade900.withOpacity(0.6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hourData?.time != null ?  DateTime.parse(hourData!.time.toString()).getTime() : '-',
                        maxLines: 3,
                        style: textTheme.titleMedium
                            ?.copyWith(color: Palette.subTitleColor),
                      ),
                      Image.asset(
                        getWeatherConditionIcon(
                            hourData?.condition?.code ?? -1, false),
                        height: 48 ,
                        width: 48,
                        fit: BoxFit.scaleDown,
                      ),
                      Text(
                        '${hourData?.tempC}°C',
                        style: textTheme.titleMedium
                            ?.copyWith(color: Palette.titleColor),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 8,
                );
              },
            ),
          )
        ],
      ),
    ).animate().fadeIn(
        duration: const Duration(seconds: 1),
        begin: 0,
        curve: Curves.easeInOut);
  }
}
