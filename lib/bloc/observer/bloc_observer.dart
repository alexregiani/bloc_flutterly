import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    print('on event -> ${bloc.runtimeType}: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -> ${bloc.runtimeType}: $error : $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print('onChange -> ${bloc.runtimeType} : $change');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('onTransition -> ${bloc.runtimeType} : $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onCreate(BlocBase bloc) {
    print('onCreate -> ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    print('onClose -> ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
