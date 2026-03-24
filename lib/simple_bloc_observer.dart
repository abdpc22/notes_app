import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class simple_bloc_observer implements BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    debugPrint("change = $change");
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    debugPrint("on close = $bloc");
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    debugPrint("onCreate = $bloc");
  }

  @override
  void onDone(
    Bloc<dynamic, dynamic> bloc,
    Object? event, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    debugPrint("on Done = $bloc");
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    // TODO: implement onTransition
  }
}
