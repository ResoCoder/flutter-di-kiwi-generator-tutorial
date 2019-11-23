import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/datasources/forecast_data_source.dart';
import '../../data/repositories/forecast_repository_impl.dart';
import '../../domain/entities/forecast.dart';
import '../../domain/entities/location.dart';
import '../../domain/usecases/get_forecast.dart';
import '../changenotifier/weather_forecast_changenotifier.dart';

class WeatherForecastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Resolving the whole dependency graph directly from the UI
      builder: (context) => WeatherForecastChangeNotifier(
        GetForecast(
          ForecastRepositoryImpl(
            FakeForecastDataSource(),
          ),
          // Instance just for testing, you'd normally
          // want to have a LocationRepository here
          Location(latitude: 0, longitude: 0),
        ),
      ),
      child: Consumer<WeatherForecastChangeNotifier>(
        builder: (context, provider, _) {
          return FutureBuilder<List<Forecast>>(
            future: provider.getForecast(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final forecasts = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: forecasts
                      .map(
                        (forecast) => Flexible(
                            child: SingleForecastWidget(forecast: forecast)),
                      )
                      .toList(),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class SingleForecastWidget extends StatelessWidget {
  final Forecast forecast;

  const SingleForecastWidget({Key key, this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Text(
            '${forecast.temperature.round().toString()}°',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Text(
            forecast.condition.toString(),
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Flexible(
          child: Text(
            forecast.date.toString(),
            style: TextStyle(fontSize: 30),
          ),
        ),
      ],
    );
  }
}
