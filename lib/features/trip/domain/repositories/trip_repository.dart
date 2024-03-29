import 'package:flutter_travel_app/features/trip/domain/entities/trip.dart';

abstract class TripRepository {
  Future<List<Trip>> getTrips();
  Future<void> addTrips(Trip trip);
  Future<void> deleteTrip(int index);
}
