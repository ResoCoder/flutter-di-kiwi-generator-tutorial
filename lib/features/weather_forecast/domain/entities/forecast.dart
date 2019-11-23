import 'package:meta/meta.dart';

class Forecast {
  final DateTime date;
  final num temperature;
  final WeatherCondition condition;

  Forecast({
    @required this.date,
    @required this.temperature,
    @required this.condition,
  });

  Forecast copyWith({
    DateTime date,
    double temperature,
    WeatherCondition condition,
  }) {
    return Forecast(
      date: date ?? this.date,
      temperature: temperature ?? this.temperature,
      condition: condition ?? this.condition,
    );
  }

  @override
  String toString() =>
      'Forecast date: $date, temperature: $temperature, condition: $condition';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Forecast &&
        o.date == date &&
        o.temperature == temperature &&
        o.condition == condition;
  }

  @override
  int get hashCode => date.hashCode ^ temperature.hashCode ^ condition.hashCode;
}

enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  atmosphere,
  clear,
  clouds,
}
