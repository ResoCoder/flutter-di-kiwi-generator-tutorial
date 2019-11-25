// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// InjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  void _configureWeatherForecastFeatureModuleFactories() {
    final Container container = Container();
    container.registerFactory(
        (c) => WeatherForecastChangeNotifier(c<GetForecast>()));
    container.registerFactory(
        (c) => GetForecast(c<ForecastRepository>(), c<Location>('London')));
    container.registerFactory<ForecastRepository, ForecastRepositoryImpl>(
        (c) => ForecastRepositoryImpl(c<ForecastDataSource>()));
    container.registerFactory<ForecastDataSource, FakeForecastDataSource>(
        (c) => FakeForecastDataSource());
  }
}
