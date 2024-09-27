import 'dart:convert';

import 'package:aetheris/features/home/domain/entity/weather_entity.dart';

// To parse super JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);
WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    super.location,
    super.current,
    super.forecast,
  });

  WeatherModel copyWith({
    LocationModel? location,
    CurrentModel? current,
    ForecastModel? forecast,
  }) =>
      WeatherModel(
        location: location ?? this.location,
        current: current ?? this.current,
        forecast: forecast ?? this.forecast,
      );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: json["location"] == null
            ? null
            : LocationModel.fromJson(json["location"]),
        current: json["current"] == null
            ? null
            : CurrentModel.fromJson(json["current"]),
        forecast: json["forecast"] == null
            ? null
            : ForecastModel.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "current": current,
        "forecast": forecast,
      };
}

class CurrentModel extends CurrentEntity {
  const CurrentModel({
    super.lastUpdatedEpoch,
    super.lastUpdated,
    super.tempC,
    super.isDay,
    super.condition,
    super.windMph,
    super.windKph,
    super.windDegree,
    super.windDir,
    super.pressureMb,
    super.pressureIn,
    super.precipitationMm,
    super.precipitationIn,
    super.humidity,
    super.cloud,
    super.feelsLikeC,
    super.windchillC,
    super.heatIndexC,
    super.dewPointC,
    super.visibilityKm,
    super.uv,
    super.gustMph,
    super.gustKph,
    super.airQuality,
  });

  CurrentModel copyWith({
    int? lastUpdatedEpoch,
    DateTime? lastUpdated,
    double? tempC,
    int? isDay,
    ConditionModel? condition,
    double? windMph,
    double? windKph,
    int? windDegree,
    String? windDir,
    double? pressureMb,
    double? pressureIn,
    double? precipitationMm,
    double? precipitationIn,
    int? humidity,
    int? cloud,
    double? feelsLikeC,
    double? windchillC,
    double? heatIndexC,
    double? dewPointC,
    double? visibilityKm,
    double? uv,
    double? gustMph,
    double? gustKph,
    Map<String, double>? airQuality,
  }) =>
      CurrentModel(
        lastUpdatedEpoch: lastUpdatedEpoch ?? this.lastUpdatedEpoch,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        tempC: tempC ?? this.tempC,
        isDay: isDay ?? this.isDay,
        condition: condition ?? this.condition,
        windMph: windMph ?? this.windMph,
        windKph: windKph ?? this.windKph,
        windDegree: windDegree ?? this.windDegree,
        windDir: windDir ?? this.windDir,
        pressureMb: pressureMb ?? this.pressureMb,
        pressureIn: pressureIn ?? this.pressureIn,
        precipitationMm: precipitationMm ?? this.precipitationMm,
        precipitationIn: precipitationIn ?? this.precipitationIn,
        humidity: humidity ?? this.humidity,
        cloud: cloud ?? this.cloud,
        feelsLikeC: feelsLikeC ?? this.feelsLikeC,
        windchillC: windchillC ?? this.windchillC,
        heatIndexC: heatIndexC ?? this.heatIndexC,
        dewPointC: dewPointC ?? this.dewPointC,
        visibilityKm: visibilityKm ?? this.visibilityKm,
        uv: uv ?? this.uv,
        gustMph: gustMph ?? this.gustMph,
        gustKph: gustKph ?? this.gustKph,
        airQuality: airQuality ?? this.airQuality,
      );

  factory CurrentModel.fromJson(Map<String, dynamic> json) => CurrentModel(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"] == null
            ? null
            : DateTime.parse(json["last_updated"]),
        tempC: json["temp_c"]?.toDouble(),
        isDay: json["is_day"],
        condition: json["condition"] == null
            ? null
            : ConditionModel.fromJson(json["condition"]),
        windMph: json["wind_mph"]?.toDouble(),
        windKph: json["wind_kph"]?.toDouble(),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"]?.toDouble(),
        pressureIn: json["pressure_in"]?.toDouble(),
        precipitationMm: json["precip_mm"]?.toDouble(),
        precipitationIn: json["precip_in"]?.toDouble(),
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelsLikeC: json["feelslike_c"]?.toDouble(),
        windchillC: json["windchill_c"]?.toDouble(),
        heatIndexC: json["heatindex_c"]?.toDouble(),
        dewPointC: json["dewpoint_c"]?.toDouble(),
        visibilityKm: json["vis_km"]?.toDouble(),
        uv: json["uv"]?.toDouble(),
        gustMph: json["gust_mph"]?.toDouble(),
        gustKph: json["gust_kph"]?.toDouble(),
        airQuality: Map.from(json["air_quality"]!)
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "is_day": isDay,
        "condition": condition,
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipitationMm,
        "precip_in": precipitationIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelsLikeC,
        "windchill_c": windchillC,
        "heatindex_c": heatIndexC,
        "dewpoint_c": dewPointC,
        "vis_km": visibilityKm,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
        "air_quality": Map.from(airQuality!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class ConditionModel extends ConditionEntity {
  const ConditionModel({
    super.text,
    super.icon,
    super.code,
  });

  ConditionModel copyWith({
    String? text,
    String? icon,
    int? code,
  }) =>
      ConditionModel(
        text: text ?? this.text,
        icon: icon ?? this.icon,
        code: code ?? this.code,
      );

  factory ConditionModel.fromJson(Map<String, dynamic> json) => ConditionModel(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };
}

class ForecastModel extends ForecastEntity {
  const ForecastModel({
    super.forecastDays,
  });

  ForecastModel copyWith({
    List<ForecastDayModel>? forecastDays,
  }) =>
      ForecastModel(
        forecastDays: forecastDays ?? this.forecastDays,
      );

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        forecastDays: json["forecastday"] == null
            ? []
            : List<ForecastDayModel>.from(
                json["forecastday"]!.map((x) => ForecastDayModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {"forecastday": forecastDays};
}

class ForecastDayModel extends ForecastDayEntity {
  const ForecastDayModel({
    super.date,
    super.dateEpoch,
    super.day,
    super.astro,
    super.hour,
  });

  ForecastDayModel copyWith({
    DateTime? date,
    int? dateEpoch,
    DayModel? day,
    AstroModel? astro,
    List<HourModel>? hour,
  }) =>
      ForecastDayModel(
        date: date ?? this.date,
        dateEpoch: dateEpoch ?? this.dateEpoch,
        day: day ?? this.day,
        astro: astro ?? this.astro,
        hour: hour ?? this.hour,
      );

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) =>
      ForecastDayModel(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        day: json["day"] == null ? null : DayModel.fromJson(json["day"]),
        astro:
            json["astro"] == null ? null : AstroModel.fromJson(json["astro"]),
        hour: json["hour"] == null
            ? []
            : List<HourModel>.from(
                json["hour"]!.map((x) => HourModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch,
        "day": day,
        "astro": astro,
        "hour": hour
      };
}

class AstroModel extends AstroEntity {
  const AstroModel({
    super.sunrise,
    super.sunset,
    super.moonrise,
    super.moonset,
    super.moonPhase,
    super.moonIllumination,
    super.isMoonUp,
    super.isSunUp,
  });

  AstroModel copyWith({
    String? sunrise,
    String? sunset,
    String? moonrise,
    String? moonset,
    String? moonPhase,
    int? moonIllumination,
    int? isMoonUp,
    int? isSunUp,
  }) =>
      AstroModel(
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
        moonrise: moonrise ?? this.moonrise,
        moonset: moonset ?? this.moonset,
        moonPhase: moonPhase ?? this.moonPhase,
        moonIllumination: moonIllumination ?? this.moonIllumination,
        isMoonUp: isMoonUp ?? this.isMoonUp,
        isSunUp: isSunUp ?? this.isSunUp,
      );

  factory AstroModel.fromJson(Map<String, dynamic> json) => AstroModel(
        sunrise: json["sunrise"] ,
        sunset: json["sunset"],
        moonrise: json["moonrise"] ,
        moonset: json["moonset"] ,
        moonPhase: json["moon_phase"],
        moonIllumination: json["moon_illumination"],
        isMoonUp: json["is_moon_up"],
        isSunUp: json["is_sun_up"],
      );

  Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "moon_illumination": moonIllumination,
        "is_moon_up": isMoonUp,
        "is_sun_up": isSunUp,
      };
}

class DayModel extends DayEntity {
  const DayModel({
    super.maxTempC,
    super.minTempC,
    super.avgTempC,
    super.maxWindMph,
    super.maxWindKph,
    super.totalPrecipitationMm,
    super.totalPrecipitationIn,
    super.totalSnowCm,
    super.averageVisibility,
    super.averageHumidity,
    super.dailyWillItRain,
    super.dailyChanceOfRain,
    super.dailyWillItSnow,
    super.dailyChanceOfSnow,
    super.condition,
    super.uv,
    super.airQuality,
  });

  DayModel copyWith({
    double? maxTempC,
    double? minTempC,
    double? avgTempC,
    double? maxWindMph,
    double? maxWindKph,
    double? totalPrecipitationMm,
    double? totalPrecipitationIn,
    double? totalSnowCm,
    double? averageVisibility,
    int? averageHumidity,
    int? dailyWillItRain,
    int? dailyChanceOfRain,
    int? dailyWillItSnow,
    int? dailyChanceOfSnow,
    ConditionModel? condition,
    double? uv,
    Map<String, double>? airQuality,
  }) =>
      DayModel(
        maxTempC: maxTempC ?? this.maxTempC,
        minTempC: minTempC ?? this.minTempC,
        avgTempC: avgTempC ?? this.avgTempC,
        maxWindMph: maxWindMph ?? this.maxWindMph,
        maxWindKph: maxWindKph ?? this.maxWindKph,
        totalPrecipitationMm: totalPrecipitationMm ?? this.totalPrecipitationMm,
        totalPrecipitationIn: totalPrecipitationIn ?? this.totalPrecipitationIn,
        totalSnowCm: totalSnowCm ?? this.totalSnowCm,
        averageVisibility: averageVisibility ?? this.averageVisibility,
        averageHumidity: averageHumidity ?? this.averageHumidity,
        dailyWillItRain: dailyWillItRain ?? this.dailyWillItRain,
        dailyChanceOfRain: dailyChanceOfRain ?? this.dailyChanceOfRain,
        dailyWillItSnow: dailyWillItSnow ?? this.dailyWillItSnow,
        dailyChanceOfSnow: dailyChanceOfSnow ?? this.dailyChanceOfSnow,
        condition: condition ?? this.condition,
        uv: uv ?? this.uv,
        airQuality: airQuality ?? this.airQuality,
      );

  factory DayModel.fromJson(Map<String, dynamic> json) => DayModel(
        maxTempC: json["maxtemp_c"]?.toDouble(),
        minTempC: json["mintemp_c"]?.toDouble(),
        avgTempC: json["avgtemp_c"]?.toDouble(),
        maxWindMph: json["maxwind_mph"]?.toDouble(),
        maxWindKph: json["maxwind_kph"]?.toDouble(),
        totalPrecipitationMm: json["totalprecip_mm"]?.toDouble(),
        totalPrecipitationIn: json["totalprecip_in"]?.toDouble(),
        totalSnowCm: json["totalsnow_cm"]?.toDouble(),
        averageVisibility: json["avgvis_km"]?.toDouble(),
        averageHumidity: json["avghumidity"],
        dailyWillItRain: json["daily_will_it_rain"],
        dailyChanceOfRain: json["daily_chance_of_rain"],
        dailyWillItSnow: json["daily_will_it_snow"],
        dailyChanceOfSnow: json["daily_chance_of_snow"],
        condition: json["condition"] == null
            ? null
            : ConditionModel.fromJson(json["condition"]),
        uv: json["uv"]?.toDouble(),
        airQuality: json["air_quality"] == null ? null : Map.from(json["air_quality"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxTempC,
        "mintemp_c": minTempC,
        "avgtemp_c": avgTempC,
        "maxwind_mph": maxWindMph,
        "maxwind_kph": maxWindKph,
        "totalprecip_mm": totalPrecipitationMm,
        "totalprecip_in": totalPrecipitationIn,
        "totalsnow_cm": totalSnowCm,
        "avgvis_km": averageVisibility,
        "avghumidity": averageHumidity,
        "daily_will_it_rain": dailyWillItRain,
        "daily_chance_of_rain": dailyChanceOfRain,
        "daily_will_it_snow": dailyWillItSnow,
        "daily_chance_of_snow": dailyChanceOfSnow,
        "condition": condition,
        "uv": uv,
        "air_quality": Map.from(airQuality!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class HourModel extends HourEntity {
  const HourModel({
    super.timeEpoch,
    super.time,
    super.tempC,
    super.isDay,
    super.condition,
    super.windMph,
    super.windKph,
    super.windDegree,
    super.windDir,
    super.pressureMb,
    super.pressureIn,
    super.precipitationMm,
    super.precipitationIn,
    super.snowCm,
    super.humidity,
    super.cloud,
    super.feelsLikeC,
    super.windchillC,
    super.heatIndexC,
    super.dewPointC,
    super.willItRain,
    super.chanceOfRain,
    super.willItSnow,
    super.chanceOfSnow,
    super.visKm,
    super.gustMph,
    super.gustKph,
    super.uv,
    super.airQuality,
    super.shortRad,
    super.diffRad,
  });

  HourModel copyWith({
    int? timeEpoch,
    String? time,
    double? tempC,
    int? isDay,
    ConditionModel? condition,
    double? windMph,
    double? windKph,
    int? windDegree,
    String? windDir,
    double? pressureMb,
    double? pressureIn,
    double? precipitationMm,
    double? precipitationIn,
    double? snowCm,
    int? humidity,
    int? cloud,
    double? feelsLikeC,
    double? windchillC,
    double? heatIndexC,
    double? dewPointC,
    int? willItRain,
    int? chanceOfRain,
    int? willItSnow,
    int? chanceOfSnow,
    double? visKm,
    double? gustMph,
    double? gustKph,
    double? uv,
    Map<String, double>? airQuality,
    double? shortRad,
    double? diffRad,
  }) =>
      HourModel(
        timeEpoch: timeEpoch ?? this.timeEpoch,
        time: time ?? this.time,
        tempC: tempC ?? this.tempC,
        isDay: isDay ?? this.isDay,
        condition: condition ?? this.condition,
        windMph: windMph ?? this.windMph,
        windKph: windKph ?? this.windKph,
        windDegree: windDegree ?? this.windDegree,
        windDir: windDir ?? this.windDir,
        pressureMb: pressureMb ?? this.pressureMb,
        pressureIn: pressureIn ?? this.pressureIn,
        precipitationMm: precipitationMm ?? this.precipitationMm,
        precipitationIn: precipitationIn ?? this.precipitationIn,
        snowCm: snowCm ?? this.snowCm,
        humidity: humidity ?? this.humidity,
        cloud: cloud ?? this.cloud,
        feelsLikeC: feelsLikeC ?? this.feelsLikeC,
        windchillC: windchillC ?? this.windchillC,
        heatIndexC: heatIndexC ?? this.heatIndexC,
        dewPointC: dewPointC ?? this.dewPointC,
        willItRain: willItRain ?? this.willItRain,
        chanceOfRain: chanceOfRain ?? this.chanceOfRain,
        willItSnow: willItSnow ?? this.willItSnow,
        chanceOfSnow: chanceOfSnow ?? this.chanceOfSnow,
        visKm: visKm ?? this.visKm,
        gustMph: gustMph ?? this.gustMph,
        gustKph: gustKph ?? this.gustKph,
        uv: uv ?? this.uv,
        airQuality: airQuality ?? this.airQuality,
        shortRad: shortRad ?? this.shortRad,
        diffRad: diffRad ?? this.diffRad,
      );

  factory HourModel.fromJson(Map<String, dynamic> json) => HourModel(
        timeEpoch: json["time_epoch"],
        time: json["time"],
        tempC: json["temp_c"]?.toDouble(),
        isDay: json["is_day"],
        condition: json["condition"] == null
            ? null
            : ConditionModel.fromJson(json["condition"]),
        windMph: json["wind_mph"]?.toDouble(),
        windKph: json["wind_kph"]?.toDouble(),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"]?.toDouble(),
        pressureIn: json["pressure_in"]?.toDouble(),
        precipitationMm: json["precip_mm"]?.toDouble(),
        precipitationIn: json["precip_in"]?.toDouble(),
        snowCm: json["snow_cm"]?.toDouble(),
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelsLikeC: json["feelslike_c"]?.toDouble(),
        windchillC: json["windchill_c"]?.toDouble(),
        heatIndexC: json["heatindex_c"]?.toDouble(),
        dewPointC: json["dewpoint_c"]?.toDouble(),
        willItRain: json["will_it_rain"],
        chanceOfRain: json["chance_of_rain"],
        willItSnow: json["will_it_snow"],
        chanceOfSnow: json["chance_of_snow"],
        visKm: json["vis_km"]?.toDouble(),
        gustMph: json["gust_mph"]?.toDouble(),
        gustKph: json["gust_kph"]?.toDouble(),
        uv: json["uv"]?.toDouble(),
        airQuality: json["air_quality"] == null ? null : Map.from(json["air_quality"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        shortRad: json["short_rad"]?.toDouble(),
        diffRad: json["diff_rad"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "time_epoch": timeEpoch,
        "time": time,
        "temp_c": tempC,
        "is_day": isDay,
        "condition": condition,
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipitationMm,
        "precip_in": precipitationIn,
        "snow_cm": snowCm,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelsLikeC,
        "windchill_c": windchillC,
        "heatindex_c": heatIndexC,
        "dewpoint_c": dewPointC,
        "will_it_rain": willItRain,
        "chance_of_rain": chanceOfRain,
        "will_it_snow": willItSnow,
        "chance_of_snow": chanceOfSnow,
        "vis_km": visKm,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
        "uv": uv,
        "air_quality": Map.from(airQuality!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "short_rad": shortRad,
        "diff_rad": diffRad,
      };
}

class LocationModel extends LocationEntity {
  const LocationModel({
    super.name,
    super.region,
    super.country,
    super.lat,
    super.lon,
    super.timezoneId,
    super.localtimeEpoch,
    super.localtime,
  });

  LocationModel copyWith({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? timezoneId,
    int? localtimeEpoch,
    String? localtime,
  }) =>
      LocationModel(
        name: name ?? this.name,
        region: region ?? this.region,
        country: country ?? this.country,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        timezoneId: timezoneId ?? this.timezoneId,
        localtimeEpoch: localtimeEpoch ?? this.localtimeEpoch,
        localtime: localtime ?? this.localtime,
      );

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        timezoneId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": timezoneId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };
}

///Based on OpenWeatherApi data
// WeatherModel weatherModelFromJson(String str) =>
//     WeatherModel.fromJson(json.decode(str));
//
// String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());
//
// class WeatherModel extends WeatherEntity {
//   WeatherModel(
//       {super.latitude,
//       super.longitude,
//       super.weatherId,
//       super.weatherMain,
//       super.weatherDescription,
//       super.temperature,
//       super.feelsLike,
//       super.pressure,
//       super.humidity,
//       super.temperatureMin,
//       super.temperatureMax,
//       super.seaLevelPressure,
//       super.groundLevelPressure,
//       super.visibility,
//       super.cloudiness,
//       super.wind,
//       super.rain,
//       super.snow,
//       super.dt,
//       super.countryCode,
//       super.sunrise,
//       super.sunset,
//       super.timezone,
//       super.cityName,
//       super.cityId});
//
//   factory WeatherModel.fromJson(Map<String, dynamic> json) {
//     Map<String, dynamic>? coordinatesObj = json["coord"];
//     Map<String, dynamic>? weatherObj = json["weather"][0];
//     Map<String, dynamic>? mainObj = json["main"];
//     Map<String, dynamic>? cloudObj = json["clouds"];
//     Map<String, dynamic>? sysObj = json["sys"];
//
//
//     return WeatherModel(
//       latitude: coordinatesObj?['lat'].toDouble(),
//       longitude: coordinatesObj?['lon'].toDouble(),
//       weatherId: weatherObj?['id'],
//       weatherDescription: weatherObj?['description'],
//       weatherMain: weatherObj?['main'],
//       temperature: mainObj?['temp'].toDouble(),
//       feelsLike: mainObj?['feels_like'].toDouble(),
//       pressure: mainObj?['pressure'].toDouble(),
//       humidity: mainObj?['humidity'].toDouble(),
//       temperatureMax: mainObj?['temp_max'].toDouble(),
//       temperatureMin: mainObj?['temp_min'].toDouble(),
//       seaLevelPressure: mainObj?['sea_level'].toDouble(),
//       groundLevelPressure: mainObj?['grnd_level'].toDouble(),
//       visibility: json["visibility"],
//       cloudiness: cloudObj?['all'],
//       wind: json["wind"] == null ? null : WindModel.fromJson(json["wind"]),
//       rain: json["rain"] == null ? null : RainModel.fromJson(json["rain"]),
//       snow: json["rain"] == null ? null : SnowModel.fromJson(json["snow"]),
//       countryCode: sysObj?['country'],
//       sunrise: sysObj == null ? null : DateTime.fromMillisecondsSinceEpoch (sysObj['sunrise'] * 1000)  ,
//       sunset:  sysObj == null ? null : DateTime.fromMillisecondsSinceEpoch(sysObj['sunset'] * 1000)  ,
//       cityId: json["id"],
//       cityName: json["name"],
//       dt: json["dt"],
//       timezone: json["timezone"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         'latitude': latitude,
//         'longitude': longitude,
//         'weatherId': weatherId,
//         'weatherDescription': weatherDescription,
//         'weatherMain': weatherMain,
//         'temperature': temperature,
//         'feelsLike': feelsLike,
//         'pressure': pressure,
//         'humidity': humidity,
//         'temperatureMax': temperatureMax,
//         'temperatureMin': temperatureMin,
//         'seaLevelPressure': seaLevelPressure,
//         'groundLevelPressure': groundLevelPressure,
//         'visibility': visibility,
//         'cloudiness': cloudiness,
//         'wind': wind,
//         'rain': rain,
//         'snow': snow,
//         'countryCode': countryCode,
//         'sunrise': sunrise,
//         'sunset': sunset,
//         'cityId': cityId,
//         'cityName': cityName,
//         'dt': dt,
//         'timezone': timezone,
//       };
// }
//
// class SnowModel extends SnowEntity {
//   SnowModel({super.the1H, super.the3H});
//
//   factory SnowModel.fromJson(Map<String, dynamic> json) => SnowModel(
//         the1H: json["1h"]?.toDouble(),
//         the3H: json["3h"]?.toDouble(),
//       );
//
//   Map<String, dynamic> toJson() => {"1h": the1H, "3h": the3H};
// }
//
// class RainModel extends RainEntity {
//   RainModel({super.the1H, super.the3H});
//
//   factory RainModel.fromJson(Map<String, dynamic> json) => RainModel(
//         the1H: json["1h"]?.toDouble(),
//         the3H: json["3h"]?.toDouble(),
//       );
//
//   Map<String, dynamic> toJson() => {"1h": the1H, "3h": the3H};
// }
//
// class WindModel extends WindEntity {
//   WindModel({
//     super.speed,
//     super.deg,
//     super.gust,
//   });
//
//   factory WindModel.fromJson(Map<String, dynamic> json) => WindModel(
//         speed: json["speed"]?.toDouble(),
//         deg: json["deg"],
//         gust: json["gust"]?.toDouble(),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "speed": speed,
//         "deg": deg,
//         "gust": gust,
//       };
// }
