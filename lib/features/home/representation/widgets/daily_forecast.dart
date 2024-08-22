import 'package:aetheris/core/theme/theme.dart';
import 'package:aetheris/core/utils/extension.dart';
import 'package:aetheris/core/utils/helpers.dart';
import 'package:aetheris/features/home/domain/entity/weather_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class DailyForecast extends StatelessWidget {
  final List<ForecastDayEntity>? _forecastDays;

  const DailyForecast({
    super.key,
    List<ForecastDayEntity>? forecastDays,
  }) : _forecastDays = forecastDays;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 210,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Next 3 days forecast",
            style: textTheme.titleMedium?.copyWith(
              color: Palette.subTitleColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _forecastDays == null || _forecastDays.isEmpty
                  ? 1
                  : _forecastDays.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (_forecastDays == null || _forecastDays.isEmpty) {
                  return const Center(
                      child: Text('No forecast data available'));
                }
                final forecastDay = _forecastDays[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(12),
                  splashFactory: InkSparkle.splashFactory,
                  onTap: () {
                    context.push('/home/details', extra: forecastDay);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade900.withOpacity(0.6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          forecastDay.date != null
                              ? DateTime.parse(forecastDay.date.toString())
                                  .getDay()
                              : '-',
                          maxLines: 3,
                          style: textTheme.titleMedium
                              ?.copyWith(color: Palette.subTitleColor),
                        ),
                        Image.asset(
                          getWeatherConditionIcon(
                              forecastDay.day?.condition?.code ?? -1, false),
                          height: 48 ,
                          width: 48,
                          fit: BoxFit.scaleDown,
                        ),
                        Text(
                          '${forecastDay.day?.avgTempC}°C',
                          style: textTheme.titleMedium
                              ?.copyWith(color: Palette.titleColor),
                        ),
                      ],
                    ),
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
