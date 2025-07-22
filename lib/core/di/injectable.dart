import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/di/injectable.config.dart';

final GetIt locator = GetIt.instance;

// This is the service locator for dependency injection using GetIt and Injectable.

@InjectableInit()
void configureDependencies() => locator.init();
