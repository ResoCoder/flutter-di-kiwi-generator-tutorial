import '../entities/forecast.dart';
import '../entities/location.dart';

abstract class ForecastRepository {
  Future<List<Forecast>> getFiveDayForecast(Location location);
}
