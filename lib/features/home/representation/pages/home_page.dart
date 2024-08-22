import 'package:aetheris/core/theme/theme.dart';
import 'package:aetheris/core/utils/extension.dart';
import 'package:aetheris/core/utils/helpers.dart';
import 'package:aetheris/features/home/domain/entity/weather_entity.dart';
import 'package:aetheris/features/home/representation/bloc/home_bloc.dart';
import 'package:aetheris/features/home/representation/widgets/daily_forecast.dart';
import 'package:aetheris/features/home/representation/widgets/hourly_forecast.dart';
import 'package:aetheris/features/home/representation/widgets/misc_data_widget.dart';
import 'package:aetheris/features/home/representation/widgets/predictions_data.dart';
import 'package:aetheris/features/home/representation/widgets/solar_lunar_data_row_widget.dart';
import 'package:aetheris/features/home/representation/widgets/temperature_row_widget.dart';
import 'package:aetheris/features/home/representation/widgets/weather_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
            edgeOffset: 48,
            backgroundColor: Colors.white,
            displacement: 70,
            color: Colors.black,
            onRefresh: () async => context.read<HomeBloc>().add(
                CurrentWeatherRequestedEvent(
                    location: _searchController.text.isNotEmpty
                        ? _searchController.text
                        : null)),
            child: CustomScrollView(
              slivers: [
                _buildSliverAppBar(textTheme),
                BlocConsumer<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is CurrentWeatherDataLoadingState) {
                      return _buildLoadingIndicator();
                    }
                    if (state is CurrentWeatherDataLoadedState) {
                      return _buildWeatherDetails(
                          state.currentWeather, size, textTheme);
                    }
                    if (state is CurrentWeatherDataLoadingFailedState) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              context.read<HomeBloc>().add(
                                    CurrentWeatherRequestedEvent(
                                        location:
                                            _searchController.text.isNotEmpty
                                                ? _searchController.text
                                                : null),
                                  );
                            },
                            icon: const Icon(Icons.refresh),
                          ),
                        ),
                      );
                    }

                    return const SliverToBoxAdapter();
                  },
                  buildWhen: (prev, curr) {
                    if (prev != curr) {
                      return true;
                    }

                    return false;
                  },
                  listener: (BuildContext context, HomeState state) {
                    if (state is CurrentWeatherDataLoadingFailedState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                )
              ],
            )),
      ),
    );
  }

  SliverToBoxAdapter _buildLoadingIndicator() {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 1,
            strokeCap: StrokeCap.round,
          ),
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(TextTheme textTheme) {
    return SliverAppBar(
      expandedHeight: 140,
      flexibleSpace: FlexibleSpaceBar(
          background: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextFormField(
            controller: _searchController,
            autofocus: false,
            onChanged: (value) => context
                .read<HomeBloc>()
                .add(CurrentWeatherRequestedEvent(location: value)),
            cursorColor: Colors.white70,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              label: Text('Search location'),
            ),
          ),
        ),
      )),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateTime.now().getGreetingsText(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Palette.titleColor),
          ),
          Text(
            DateTime.now().getFormattedDate(),
            style: textTheme.titleMedium?.copyWith(
              color: Palette.subTitleColor,
            ),
          )
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildWeatherDetails(
      WeatherEntity weatherEntity, Size size, TextTheme textTheme) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            WeatherImage(
                conditionCode: weatherEntity.current?.condition?.code, isDay: weatherEntity.current?.isDay == 1),
            const SizedBox(
              height: 24,
            ),
            Text(
              '${weatherEntity.current?.tempC?.round()}°C',
              style:
                  textTheme.displayLarge?.copyWith(color: Palette.titleColor),
            ),
            Text(
              '${weatherEntity.current?.condition?.text?.toUpperCase()}',
              style: textTheme.titleLarge?.copyWith(color: Palette.titleColor),
            ),
            RichText(
              text: TextSpan(
                text:
                    '${weatherEntity.location?.name}, ${weatherEntity.location?.country}',
                style: textTheme.titleSmall
                    ?.copyWith(color: Palette.subTitleColor),
                children: const [
                  WidgetSpan(
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Palette.subTitleColor,
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Last updated ${weatherEntity.current?.lastUpdated?.getTime()}',
              style:
                  textTheme.titleSmall?.copyWith(color: Palette.subTitleColor),
            ),
            Text(
              'Feels Like ${weatherEntity.current?.feelsLikeC?.round()}°C',
              style:
                  textTheme.titleMedium?.copyWith(color: Palette.subTitleColor),
            ),
            HourlyForecast(
              forecastDayEntity: weatherEntity.forecast?.forecastDays?.first,
            ),
            PredictionsData(
              forecastDayEntity: weatherEntity.forecast?.forecastDays?.first,
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade900.withOpacity(0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SolarLunarDataRowWidget(
                    sunrise: weatherEntity
                        .forecast?.forecastDays?.first.astro?.sunrise,
                    sunset: weatherEntity
                        .forecast?.forecastDays?.first.astro?.sunset,
                  ),
                  const Divider(
                    thickness: 0.5,
                  ),
                  TemperatureRowWidget(
                    maxTemp: weatherEntity
                        .forecast?.forecastDays?.first.day?.maxTempC,
                    minTemp: weatherEntity
                        .forecast?.forecastDays?.first.day?.minTempC,
                  )
                ],
              ).animate().fadeIn(
                  duration: const Duration(seconds: 2),
                  begin: 0,
                  curve: Curves.easeInOut),
            ),
            const SizedBox(
              height: 12,
            ),
            MiscDataWidget(
              pressure: weatherEntity.current?.pressureMb,
              humidity: weatherEntity.current?.humidity?.toDouble(),
              visibility: weatherEntity.current?.visibilityKm,
              wind: weatherEntity.current?.windKph,
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade900.withOpacity(0.5),
              ),
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
                                      text: '${weatherEntity.current?.uv}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(color: Colors.white),
                                    )
                                  ]))
                            ],
                          )),
                      SizedBox(
                          width: size.width * 0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                CupertinoIcons.wind_snow,
                                color: Colors.white,
                                size: 48,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: 'Wind chill\n',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: Palette.subTitleColor),
                                      children: [
                                    TextSpan(
                                      text:
                                          '${weatherEntity.current?.windchillC?.round()}°C',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(color: Colors.white),
                                    )
                                  ]))
                            ],
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
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
                                              color: Palette.subTitleColor),
                                      children: [
                                    TextSpan(
                                      text: getAirQualityCategory(weatherEntity
                                          .current
                                          ?.airQuality?['us-epa-index']),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(color: Colors.white),
                                    )
                                  ]))
                            ],
                          )),
                      SizedBox(
                        width: size.width * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              CupertinoIcons.cloud_sun,
                              color: Colors.white,
                              size: 48,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Cloudiness\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Palette.subTitleColor),
                                children: [
                                  TextSpan(
                                    text:
                                        '${weatherEntity.current?.cloud?.round()}%',
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
                      )
                    ],
                  )
                ],
              ).animate().fadeIn(
                  duration: const Duration(seconds: 2),
                  begin: 0,
                  curve: Curves.easeInOut),
            ),
            DailyForecast(
              forecastDays: weatherEntity.forecast?.forecastDays,
            )
          ],
        ).animate().fadeIn(
            duration: const Duration(seconds: 2),
            begin: 0,
            curve: Curves.easeInOut),
      ),
    );
  }
}


