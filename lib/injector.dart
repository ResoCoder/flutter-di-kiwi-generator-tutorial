import 'package:kiwi/kiwi.dart';
import 'package:kiwi_generated_di_tutorial/features/weather_forecast/data/datasources/forecast_data_source.dart';
import 'package:kiwi_generated_di_tutorial/features/weather_forecast/data/repositories/forecast_repository_impl.dart';
import 'package:kiwi_generated_di_tutorial/features/weather_forecast/domain/entities/location.dart';

import 'features/weather_forecast/domain/repositories/forecast_repository.dart';
import 'features/weather_forecast/presentation/changenotifier/weather_forecast_changenotifier.dart';
import 'features/weather_forecast/domain/usecases/get_forecast.dart';

part 'injector.g.dart';

abstract class Injector {
  static Container container;

  static void setup() {
    container = Container();
    _$Injector()._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureWeatherForecastFeatureModuleModule();
  }

  //! WeatherForecastFeatureModule
  void _configureWeatherForecastFeatureModuleModule() {
    _configureWeatherForecastFeatureModuleInstances();
    _configureWeatherForecastFeatureModuleFactories();
  }

  void _configureWeatherForecastFeatureModuleInstances() {
    container.registerInstance(Location(latitude: 0, longitude: 0));
    container.registerInstance(
      Location(latitude: 51.5073, longitude: -0.1277),
      name: 'London',
    );
  }

  @Register.factory(WeatherForecastChangeNotifier)
  @Register.factory(GetForecast, resolvers: {Location: 'London'})
  @Register.factory(ForecastRepository, from: ForecastRepositoryImpl)
  @Register.factory(ForecastDataSource, from: FakeForecastDataSource)
  void _configureWeatherForecastFeatureModuleFactories();
}
