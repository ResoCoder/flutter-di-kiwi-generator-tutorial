import '../entities/forecast.dart';
import '../entities/location.dart';
import '../repositories/forecast_repository.dart';

class GetForecast {
  final ForecastRepository forecastRepository;
  // Instance just for testing, you'd normally want to have a LocationRepository here
  final Location location;

  GetForecast(
    this.forecastRepository,
    this.location,
  );

  Future<List<Forecast>> call() async {
    // Without error handling 😢😱 Chill out, it's just a DI tutorial 😅
    return await forecastRepository.getFiveDayForecast(location);
  }
}
