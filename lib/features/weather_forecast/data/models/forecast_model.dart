import 'dart:convert';

import 'package:meta/meta.dart';

import '../../domain/entities/forecast.dart';

class ForecastModel {
  final int dateTimeSecondsUTC;
  final num temperature;
  final int conditionID;

  ForecastModel({
    @required this.dateTimeSecondsUTC,
    @required this.temperature,
    @required this.conditionID,
  });

  Forecast toEntity() {
    return Forecast(
      date: DateTime.fromMillisecondsSinceEpoch(dateTimeSecondsUTC * 1000),
      temperature: temperature,
      condition: idToWeatherCondition(conditionID),
    );
  }

  WeatherCondition idToWeatherCondition(int conditionID) {
    if (conditionID >= 200 && conditionID <= 232) {
      return WeatherCondition.thunderstorm;
    } else if (conditionID >= 300 && conditionID <= 321) {
      return WeatherCondition.drizzle;
    } else if (conditionID >= 500 && conditionID <= 531) {
      return WeatherCondition.rain;
    } else if (conditionID >= 600 && conditionID <= 622) {
      return WeatherCondition.snow;
    } else if (conditionID >= 700 && conditionID <= 781) {
      return WeatherCondition.atmosphere;
    } else if (conditionID == 800) {
      return WeatherCondition.clear;
    } else if (conditionID >= 801 && conditionID <= 804) {
      return WeatherCondition.clouds;
    } else {
      throw WeatherConditionInvalidError();
    }
  }

  ForecastModel copyWith({
    int dateTimeIntUTC,
    double temperature,
    int conditionID,
  }) {
    return ForecastModel(
      dateTimeSecondsUTC: dateTimeIntUTC ?? this.dateTimeSecondsUTC,
      temperature: temperature ?? this.temperature,
      conditionID: conditionID ?? this.conditionID,
    );
  }

  static ForecastModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ForecastModel(
      dateTimeSecondsUTC: map['dt'],
      temperature: map['main']['temp'],
      conditionID: map['weather'][0]['id'],
    );
  }

  static ForecastModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'ForecastModel dateTimeIntUTC: $dateTimeSecondsUTC, temperature: $temperature, conditionID: $conditionID';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ForecastModel &&
        o.dateTimeSecondsUTC == dateTimeSecondsUTC &&
        o.temperature == temperature &&
        o.conditionID == conditionID;
  }

  @override
  int get hashCode =>
      dateTimeSecondsUTC.hashCode ^ temperature.hashCode ^ conditionID.hashCode;
}

class WeatherConditionInvalidError extends Error {}
