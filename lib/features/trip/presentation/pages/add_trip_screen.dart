import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_travel_app/features/trip/domain/entities/trip.dart';
import 'package:flutter_travel_app/features/trip/presentation/providers/trip_providers.dart';

class AddTripScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController(text: "City 1");
  final _descController = TextEditingController(text: "Best city ever");
  final _locationController = TextEditingController(text: "Paris");
  final _pictureController =
      TextEditingController(text: 'https://rb.gy/f1bc5s');
  List<String> pictures = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextFormField(
            controller: _descController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          TextFormField(
            controller: _locationController,
            decoration: InputDecoration(labelText: 'Location'),
          ),
          TextFormField(
            controller: _pictureController,
            decoration: InputDecoration(labelText: 'Photo'),
          ),
          ElevatedButton(
            onPressed: () {
              pictures.add(_pictureController.text);
              if (_formKey.currentState!.validate()) {
                final newTrip = Trip(
                  title: _titleController.text,
                  description: _descController.text,
                  location: _locationController.text,
                  photos: pictures,
                );
                ref.read(tripListNotifierProvider.notifier).addNewTrip(newTrip);
                // ref.read(tripListNotifierProvider.notifier).loadTrips();
                //Navigator.pop(context);
              }
            },
            child: Text('Add Trip'),
          ),
        ],
      ),
    );
  }
}
