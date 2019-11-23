import 'package:flutter/material.dart';

import 'features/weather_forecast/presentation/widgets/weather_forecast_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: WeatherForecastWidget(),
        ),
      ),
    );
  }
}
