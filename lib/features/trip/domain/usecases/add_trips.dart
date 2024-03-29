import 'package:flutter_travel_app/features/trip/domain/entities/trip.dart';
import 'package:flutter_travel_app/features/trip/domain/repositories/trip_repository.dart';

class AddTrip {
  final TripRepository repository;

  AddTrip(this.repository);

  Future<void> call(Trip trip) {
    return repository.addTrips(trip);
  }
}
