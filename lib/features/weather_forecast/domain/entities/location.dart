import 'package:meta/meta.dart';

class Location {
  final double longitude;
  final double latitude;

  Location({
    @required this.longitude,
    @required this.latitude,
  });

  Location copyWith({
    double longitude,
    double latitude,
  }) {
    return Location(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  @override
  String toString() => 'Location longitude: $longitude, latitude: $latitude';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Location && o.longitude == longitude && o.latitude == latitude;
  }

  @override
  int get hashCode => longitude.hashCode ^ latitude.hashCode;
}
