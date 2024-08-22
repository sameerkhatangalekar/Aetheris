import 'package:intl/intl.dart';
import 'dart:developer' as devtools show log;

extension DateTimeExtentions on DateTime {
  String getFormattedDate() {
    return DateFormat('E, MMM dd - hh:mm a').format(this);
  }

  String getDate() {
    return DateFormat('E dd-MM-yyyy').format(this);
  }


  String getTime() {
    return DateFormat('hh:mm a').format(this);
  }

  String getDay() {
    return DateFormat('EEE').format(this);
  }

  String getGreetingsText() {
    if (hour >= 1 && hour <= 11) {
      return 'Morning';
    }
    if (hour >= 12 && hour <= 17) {
      return 'Afternoon';
    }
    if (hour >= 18 && hour <= 21) {
      return 'Evening';
    }
    return 'Night';
  }
}

extension LogExtension on Object {
  void log() => devtools.log(toString());
}
