import 'package:flutter_travel_app/features/trip/domain/entities/trip.dart';
import 'package:hive/hive.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String> photos;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime data;
  @HiveField(4)
  final String location;

  TripModel(
      {required this.title,
      required this.photos,
      required this.description,
      required this.data,
      required this.location});

//Conversion from Entities to Model
  factory TripModel.fromEntities(Trip trip) => TripModel(
      title: trip.title,
      photos: trip.photos,
      description: trip.description,
      data: trip.data,
      location: trip.location);

  // Conversion from Model to Entities
  Trip toEntities() => Trip(
      title: title,
      photos: photos,
      description: description,
      data: data,
      location: location);
}
