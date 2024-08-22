library;

import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final LocationEntity? location;
  final CurrentEntity? current;
  final ForecastEntity? forecast;

  const WeatherEntity({
    this.location,
    this.current,
    this.forecast,
  });

  @override
  List<Object?> get props => [
        location,
        current,
        forecast,
      ];
}

class CurrentEntity extends Equatable {
  final int? lastUpdatedEpoch;
  final DateTime? lastUpdated;
  final double? tempC;
  final int? isDay;
  final ConditionEntity? condition;
  final double? windMph;
  final double? windKph;
  final int? windDegree;
  final String? windDir;
  final double? pressureMb;
  final double? pressureIn;
  final double? precipitationMm;
  final double? precipitationIn;
  final int? humidity;
  final int? cloud;
  final double? feelsLikeC;
  final double? windchillC;
  final double? heatIndexC;
  final double? dewPointC;
  final double? visibilityKm;
  final double? uv;
  final double? gustMph;
  final double? gustKph;
  final Map<String, double>? airQuality;

  const CurrentEntity({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipitationMm,
    this.precipitationIn,
    this.humidity,
    this.cloud,
    this.feelsLikeC,
    this.windchillC,
    this.heatIndexC,
    this.dewPointC,
    this.visibilityKm,
    this.uv,
    this.gustMph,
    this.gustKph,
    this.airQuality,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        lastUpdatedEpoch,
        lastUpdated,
        tempC,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipitationMm,
        precipitationIn,
        humidity,
        cloud,
        feelsLikeC,
        windchillC,
        heatIndexC,
        dewPointC,
        visibilityKm,
        uv,
        gustMph,
        gustKph,
        airQuality,
      ];
}

class ConditionEntity extends Equatable {
  final String? text;
  final String? icon;
  final int? code;

  const ConditionEntity({
    this.text,
    this.icon,
    this.code,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        text,
        icon,
        code,
      ];
}

class ForecastEntity extends Equatable {
  final List<ForecastDayEntity>? forecastDays;

  const ForecastEntity({
    this.forecastDays,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [forecastDays];
}

class ForecastDayEntity extends Equatable {
  final DateTime? date;
  final int? dateEpoch;
  final DayEntity? day;
  final AstroEntity? astro;
  final List<HourEntity>? hour;

  const ForecastDayEntity({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [date, dateEpoch, day, astro, hour];
}

class AstroEntity extends Equatable {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  final String? moonPhase;
  final int? moonIllumination;
  final int? isMoonUp;
  final int? isSunUp;

  const AstroEntity({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        sunrise,
        sunset,
        moonrise,
        moonset,
        moonPhase,
        moonIllumination,
        isMoonUp,
        isSunUp,
      ];
}

class DayEntity extends Equatable {
  final double? maxTempC;
  final double? minTempC;
  final double? avgTempC;
  final double? maxWindMph;
  final double? maxWindKph;
  final double? totalPrecipitationMm;
  final double? totalPrecipitationIn;
  final double? totalSnowCm;
  final double? averageVisibility;
  final int? averageHumidity;
  final int? dailyWillItRain;
  final int? dailyChanceOfRain;
  final int? dailyWillItSnow;
  final int? dailyChanceOfSnow;
  final ConditionEntity? condition;
  final double? uv;
  final Map<String, double>? airQuality;

  const DayEntity(
      {this.maxTempC,
      this.minTempC,
      this.avgTempC,
      this.maxWindMph,
      this.maxWindKph,
      this.totalPrecipitationMm,
      this.totalPrecipitationIn,
      this.totalSnowCm,
      this.averageVisibility,
      this.averageHumidity,
      this.dailyWillItRain,
      this.dailyChanceOfRain,
      this.dailyWillItSnow,
      this.dailyChanceOfSnow,
      this.condition,
      this.uv,
      this.airQuality});

  @override
  // TODO: implement props
  List<Object?> get props => [
        maxTempC,
        minTempC,
        avgTempC,
        maxWindMph,
        maxWindKph,
        totalPrecipitationMm,
        totalPrecipitationIn,
        totalSnowCm,
        averageVisibility,
        averageHumidity,
        dailyWillItRain,
        dailyChanceOfRain,
        dailyWillItSnow,
        dailyChanceOfSnow,
        condition,
        uv,
        airQuality
      ];
}

class HourEntity extends Equatable {
  final int? timeEpoch;
  final String? time;
  final double? tempC;
  final int? isDay;
  final ConditionEntity? condition;
  final double? windMph;
  final double? windKph;
  final int? windDegree;
  final String? windDir;
  final double? pressureMb;
  final double? pressureIn;
  final double? precipitationMm;
  final double? precipitationIn;
  final double? snowCm;
  final int? humidity;
  final int? cloud;
  final double? feelsLikeC;
  final double? windchillC;
  final double? heatIndexC;
  final double? dewPointC;
  final int? willItRain;
  final int? chanceOfRain;
  final int? willItSnow;
  final int? chanceOfSnow;
  final double? visKm;

  final double? gustMph;
  final double? gustKph;
  final double? uv;
  final Map<String, double>? airQuality;
  final double? shortRad;
  final double? diffRad;

  const HourEntity({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipitationMm,
    this.precipitationIn,
    this.snowCm,
    this.humidity,
    this.cloud,
    this.feelsLikeC,
    this.windchillC,
    this.heatIndexC,
    this.dewPointC,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.gustMph,
    this.gustKph,
    this.uv,
    this.airQuality,
    this.shortRad,
    this.diffRad,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        timeEpoch,
        time,
        tempC,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipitationMm,
        precipitationIn,
        snowCm,
        humidity,
        cloud,
        feelsLikeC,
        windchillC,
        heatIndexC,
        dewPointC,
        willItRain,
        chanceOfRain,
        willItSnow,
        chanceOfSnow,
        visKm,
        gustMph,
        gustKph,
        uv,
        airQuality,
        shortRad,
        diffRad
      ];
}

class LocationEntity extends Equatable {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? timezoneId;
  final int? localtimeEpoch;
  final String? localtime;

  const LocationEntity({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.timezoneId,
    this.localtimeEpoch,
    this.localtime,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        region,
        country,
        lat,
        lon,
        timezoneId,
        localtimeEpoch,
        localtime
      ];
}

/// Base on OpenWeather api data ////
// class WeatherEntity {
//   final double? latitude;
//   final double? longitude;
//   final int? weatherId;
//   final String? weatherMain;
//   final String? weatherDescription;
//   final double? temperature;
//   final double? feelsLike;
//   final double? pressure;
//   final double? humidity;
//   final double? temperatureMin;
//   final double? temperatureMax;
//   final double? seaLevelPressure;
//   final double? groundLevelPressure;
//   final int? visibility;
//   final int? cloudiness;
//   final WindEntity? wind;
//   final RainEntity? rain;
//   final SnowEntity? snow;
//   final int? dt;
//   final String? countryCode;
//   final DateTime? sunrise;
//   final DateTime? sunset;
//   final int? timezone;
//   final String? cityName;
//   final int? cityId;
//
//   WeatherEntity(
//       {
//         this.latitude,
//       this.longitude,
//       this.weatherId,
//       this.weatherMain,
//       this.weatherDescription,
//       this.temperature,
//       this.feelsLike,
//       this.pressure,
//       this.humidity,
//       this.temperatureMin,
//       this.temperatureMax,
//       this.seaLevelPressure,
//       this.groundLevelPressure,
//       this.visibility,
//       this.cloudiness,
//       this.wind,
//       this.rain,
//       this.snow,
//       this.dt,
//       this.countryCode,
//       this.sunrise,
//       this.sunset,
//       this.timezone,
//       this.cityName,
//       this.cityId
//       });
// }
//
//
// class RainEntity {
//   final double? the1H;
//   final double? the3H;
//
//   RainEntity({this.the1H, this.the3H});
// }
//
// class SnowEntity {
//   final double? the1H;
//   final double? the3H;
//
//   SnowEntity({this.the1H, this.the3H});
// }
//
// class WindEntity {
//   final double? speed;
//   final int? deg;
//   final double? gust;
//
//   WindEntity({
//     this.speed,
//     this.deg,
//     this.gust,
//   });
// }
