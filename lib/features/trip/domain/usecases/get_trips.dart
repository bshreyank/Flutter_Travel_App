import 'package:flutter_travel_app/features/trip/domain/entities/trip.dart';
import 'package:flutter_travel_app/features/trip/domain/repositories/trip_repository.dart';

class GetTrips {
  final TripRepository repository;

  GetTrips(this.repository);

  Future<List<Trip>> call() {
    return repository.getTrips();
  }
}
