// if we are working with remote data like Hive for example, this place is where the API will be called.;
// We are going to have 3 main funcationality addTrips, getTrips, deleteTrips.
// So if we are using API, this place is called trip remote data sources and it will make an API call with dio or http directly on our API.
// But in our case we are going to use Hive
import 'package:flutter_travel_app/features/trip/data/models/trip_model.dart';
import 'package:hive/hive.dart';

class TripLocalDataSource {
  final Box<TripModel> tripBox;

  TripLocalDataSource(this.tripBox);

  List<TripModel> getTrip() {
    return tripBox.values.toList();
  }

  void addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  void deleteTrip(int index) { 
    tripBox.delete(index);
  }
}
