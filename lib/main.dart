import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_travel_app/features/trip/data/models/trip_model.dart';
import 'package:flutter_travel_app/features/trip/presentation/pages/main_screen.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Save all the information in some specify path in my device
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);

  //Register Adapter
  Hive.registerAdapter(TripModelAdapter());

  // Initialize hive and open our box.
  await Hive.openBox<TripModel>('trips');

  //main widget
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      home: MainScreen(),
    );
  }
}
