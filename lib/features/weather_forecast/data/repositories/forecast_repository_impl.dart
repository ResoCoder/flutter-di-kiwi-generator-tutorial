import '../../domain/entities/forecast.dart';
import '../../domain/entities/location.dart';
import '../../domain/repositories/forecast_repository.dart';
import '../datasources/forecast_data_source.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final ForecastDataSource forecastDataSource;

  ForecastRepositoryImpl(this.forecastDataSource);

  @override
  Future<List<Forecast>> getFiveDayForecast(Location location) async {
    final forecastModelList =
        await forecastDataSource.getFiveDayForecast(location);
    return forecastModelList
        .map((forecastModel) => forecastModel.toEntity())
        .toList();
  }
}
