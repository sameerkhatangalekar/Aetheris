import 'package:aetheris/core/theme/theme.dart';
import 'package:aetheris/core/utils/extension.dart';
import 'package:aetheris/core/utils/helpers.dart';
import 'package:aetheris/features/home/domain/entity/weather_entity.dart';
import 'package:aetheris/features/home/representation/widgets/hourly_forecast.dart';
import 'package:aetheris/features/home/representation/widgets/misc_data_widget.dart';
import 'package:aetheris/features/home/representation/widgets/predictions_data.dart';
import 'package:aetheris/features/home/representation/widgets/solar_lunar_data_row_widget.dart';
import 'package:aetheris/features/home/representation/widgets/temperature_row_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ForecastDetailsPage extends StatelessWidget {
  final ForecastDayEntity _forecastDayEntity;

  const ForecastDetailsPage(
      {super.key, required ForecastDayEntity forecastDayEntity})
      : _forecastDayEntity = forecastDayEntity;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            title: Text(
              _forecastDayEntity.date!.getDate(),
              style: textTheme.titleMedium?.copyWith(
                color: Palette.subTitleColor,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Image.asset(
                      getWeatherConditionIcon(_forecastDayEntity.day!.condition?.code ,false),
                      height: size.height * 0.3,
                    ).animate().scaleXY(
                        duration: const Duration(seconds: 2),
                        begin: 0.0,
                        end: 1,
                        curve: Curves.easeInOut),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    '${_forecastDayEntity.day!.avgTempC!.round()}°C',
                    style: textTheme.displayLarge
                        ?.copyWith(color: Palette.titleColor),
                  ),
                  Text(
                    _forecastDayEntity.day!.condition!.text!.toUpperCase(),
                    style: textTheme.titleLarge
                        ?.copyWith(color: Palette.titleColor),
                  ),
                  HourlyForecast(
                    forecastDayEntity: _forecastDayEntity,
                  ),
                  PredictionsData(
                    forecastDayEntity: _forecastDayEntity,
                  ),
                  const SizedBox(height: 12,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade900.withOpacity(0.6),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SolarLunarDataRowWidget(
                          sunrise: _forecastDayEntity.astro!.sunrise,
                          sunset: _forecastDayEntity.astro!.sunset,
                        ),
                        const Divider(
                          thickness: 0.5,
                        ),
                        TemperatureRowWidget(
                          maxTemp: _forecastDayEntity.day!.maxTempC,
                          minTemp: _forecastDayEntity.day!.minTempC,
                        )
                      ],
                    ).animate().fadeIn(
                        duration: const Duration(seconds: 2),
                        begin: 0,
                        curve: Curves.easeInOut),
                  ),
                  const SizedBox(height: 12,),
                  MiscDataWidget(
                    humidity: _forecastDayEntity.day!.averageHumidity?.toDouble(),
                    visibility: _forecastDayEntity.day!.averageVisibility,
                    wind: _forecastDayEntity.day!.maxWindKph,
                  ),
                  const SizedBox(height: 12,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade900.withOpacity(0.6),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  const Icon(
                                    CupertinoIcons.sun_max,
                                    size: 48,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'UV\n',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                          color: Palette.subTitleColor),
                                      children: [
                                        TextSpan(
                                          text: '${_forecastDayEntity.day!.uv}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                                width: size.width * 0.4,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.masks_outlined,
                                      size: 48,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: 'AQI\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                color: Palette
                                                    .subTitleColor),
                                            children: [
                                              TextSpan(
                                                text: getAirQualityCategory(
                                                    _forecastDayEntity.day
                                                    !.airQuality?[
                                                    'us-epa-index']),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                    color: Colors.white),
                                              )
                                            ]))
                                  ],
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ).animate().fadeIn(
                        duration: const Duration(seconds: 2),
                        begin: 0,
                        curve: Curves.easeInOut),
                  ),
                ],
              ).animate().fadeIn(
                  duration: const Duration(seconds: 2),
                  begin: 0,
                  curve: Curves.easeInOut),
            ),
          ),

        ],
      )),
    );
  }
}
