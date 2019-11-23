import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/entities/forecast.dart';
import '../../domain/usecases/get_forecast.dart';

class WeatherForecastChangeNotifier extends ChangeNotifier {
  final GetForecast _getForecastUsecase;

  WeatherForecastChangeNotifier(this._getForecastUsecase);

  Future<List<Forecast>> getForecast() async {
    return await _getForecastUsecase();
  }
}
