import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class CustomBlocObserver extends BlocObserver {
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    if (kDebugMode) {
      debugPrint('Bloc: ${bloc.runtimeType} - Change: $change');
    }
  }
}
