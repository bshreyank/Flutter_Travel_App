import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_travel_app/features/trip/data/datasources/trip_local_datasource.dart';
import 'package:flutter_travel_app/features/trip/data/models/trip_model.dart';
import 'package:flutter_travel_app/features/trip/data/repositories/trip_repository_impl.dart';
import 'package:flutter_travel_app/features/trip/domain/entities/trip.dart';
import 'package:flutter_travel_app/features/trip/domain/repositories/trip_repository.dart';
import 'package:flutter_travel_app/features/trip/domain/usecases/add_trips.dart';
import 'package:flutter_travel_app/features/trip/domain/usecases/delete_trips.dart';
import 'package:flutter_travel_app/features/trip/domain/usecases/get_trips.dart';
import 'package:hive/hive.dart';

//Define trip - local data source provider -------------------------------------------->
final tripLocalDataSourceProvider = Provider<TripLocalDataSource>((ref) {
  final Box<TripModel> tripBox = Hive.box('trips');
  return TripLocalDataSource(tripBox);
});

//Define trip Repository Provider -------------------------------------------->
final tripRepositoryProvider = Provider<TripRepository>((ref) {
  final localDataSource = ref.read(tripLocalDataSourceProvider);
  return TripRepositoryImpl(localDataSource);
});

//Define all CRUD functions -------------------------------------------->
final addTripProvider = Provider<AddTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return AddTrip(repository);
});

final getTripsProvider = Provider<GetTrips>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return GetTrips(repository);
});

final deleteTripProvider = Provider<DeleteTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return DeleteTrip(repository);
});

// Define notifier provider -------------------------------------------->
final tripListNotifierProvider =
    StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
  final getTrips = ref.read(getTripsProvider);
  final addTrip = ref.read(addTripProvider);
  final deleteTrip = ref.read(deleteTripProvider);

  return TripListNotifier(getTrips, addTrip, deleteTrip);
});

//Define the Trip List Notifier Constructor -------------------------------------------->
class TripListNotifier extends StateNotifier<List<Trip>> {
  final GetTrips _getTrips;
  final AddTrip _addTrip;
  final DeleteTrip _deleteTrip;

  TripListNotifier(this._getTrips, this._addTrip, this._deleteTrip) : super([]);

  Future<void> addNewTrip(Trip trip) async {
    await _addTrip(trip);
  }

  Future<void> removeTrip(int tripId) async {
    await _deleteTrip(tripId);
  }

  Future<void> loadTrip() async {
    await _getTrips();
  }
}
