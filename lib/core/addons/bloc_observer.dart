import 'dart:developer';

import 'package:bloc/bloc.dart';

/// Custom BlocObserver to log Bloc lifecycle events.
/// This observer logs the creation, state changes, errors, and closure of Blocs.
/// It extends [BlocObserver] and overrides its methods to provide custom logging.
/// It is useful for debugging and monitoring the behavior of Blocs in the application.
class ProjectBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    log('onCreate -- [${bloc.runtimeType}]');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('''
        onChange -- [${bloc.runtimeType}]
        current: ${change.currentState}
        next: ${change.nextState}
    ''');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose -- [${bloc.runtimeType}]');
  }
}
