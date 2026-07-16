import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wat_schedule/core/addons/bloc_observer.dart';
import 'package:wat_schedule/core/di/injectable.dart';

/// This class contains the main methods for initializing the application.
/// It sets up the necessary configurations such as hydration storage,
/// preferred device orientations, and the custom Bloc observer.
/// It is used to ensure that the application runs smoothly and efficiently.
/// The `initialize` method is called in the main entry point of the application.
/// It initializes the Flutter binding, sets up the storage for hydrated blocs,
/// and configures the device orientation and Bloc observer.
/// This class is essential for the proper functioning of the application
/// and should be called before running the app.
abstract final class AppInitializer {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    final Directory directory = await getApplicationDocumentsDirectory();

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(directory.path),
    );

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    Bloc.observer = ProjectBlocObserver();

    configureDependencies();
  }
}
