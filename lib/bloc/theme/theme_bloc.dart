import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    // on<DarkThemeSwitchEvent>((event, emit) {
    //   emit(state.copyWith(darkMode: true));
    // });
    // on<LightThemeSwitchEvent>((event, emit) {
    //   emit(state.copyWith(darkMode: false));
    // });
    on<ThemeSwitchEvent>((event, emit) {
      emit(state.copyWith(appTheme: state.appTheme == AppTheme.light ? AppTheme.dark : AppTheme.light));
    });
  }
}
