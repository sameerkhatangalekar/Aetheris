String getWeatherConditionIcon(int? code, bool? isDay ) {
  isDay ??= true;
  switch (code) {
    case 1000:
      return isDay ? "assets/icons/800.png" : "assets/icons/800_night.png";
    case 1003:
      return isDay ? "assets/icons/801.png" : "assets/icons/801_night.png";
    case 1006:
      return "assets/icons/701.png";
    case 1009:
      return "assets/icons/701.png";
    case 1030:
      return "assets/icons/804.png";
    case 1063:
      return "assets/icons/500.png";
    case 1066:
      return "assets/icons/600.png";
    case 1069:
      return "assets/icons/511.png";
    case 1072:
      return "assets/icons/511.png";
    case 1087:
      return "assets/icons/210.png";
    case 1114:
      return "assets/icons/601.png";
    case 1117:
      return "assets/icons/600.png";
    case 1135:
      return "assets/icons/804.png";
    case 1147:
      return "assets/icons/804.png";
    case 1150:
      return "assets/icons/500.png";
    case 1153:
      return "assets/icons/500.png";
    case 1168:
      return "assets/icons/502.png";
    case 1171:
      return "assets/icons/511.png";
    case 1180:
      return "assets/icons/500.png";
    case 1183:
      return "assets/icons/500.png";
    case 1186:
      return "assets/icons/502.png";
    case 1189:
      return "assets/icons/502.png";
    case 1192:
      return "assets/icons/502.png";
    case 1195:
      return "assets/icons/502.png";
    case 1198:
      return "assets/icons/502.png";
    case 1201:
      return "assets/icons/511.png";
    case 1204:
      return "assets/icons/511.png";
    case 1207:
      return "assets/icons/511.png";
    case 1210:
      return "assets/icons/601.png";
    case 1213:
      return "assets/icons/601.png";
    case 1216:
      return "assets/icons/601.png";
    case 1219:
      return "assets/icons/601.png";
    case 1222:
      return "assets/icons/600.png";
    case 1225:
      return "assets/icons/600.png";
    case 1237:
      return "assets/icons/600.png";
    case 1240:
      return "assets/icons/500.png";
    case 1243:
      return "assets/icons/502.png";
    case 1246:
      return "assets/icons/502.png";
    case 1249:
      return "assets/icons/511.png";
    case 1252:
      return "assets/icons/511.png";
    case 1255:
      return "assets/icons/601.png";
    case 1258:
      return "assets/icons/601.png";
    case 1261:
      return "assets/icons/601.png";
    case 1264:
      return "assets/icons/600.png";
    case 1273:
      return "assets/icons/201.png";
    case 1276:
      return "assets/icons/201.png";
    case 1279:
      return "assets/icons/212.png";
    case 1282:
      return "assets/icons/221.png";
    default:
      return "assets/icons/804.png";
  }
}

String getAirQualityCategory(level) {
  switch (level) {
    case 1:
      return 'Good';
    case 2:
      return 'Moderate';
    case 3:
      return 'Unhealthy for Sensitive Groups';
    case 4:
      return 'Unhealthy';
    case 5:
      return 'Very Unhealthy';
    case 6:
      return 'Hazardous';
    default:
      return 'Unknown';
  }
}


