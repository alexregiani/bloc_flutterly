import 'package:bloc/bloc.dart';
import 'package:bloc_flutterly/blocs/theme_bloc/theme_state_bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ChangeThemeEvent>((event, emit) {
      if (event.randInt % 2 == 0) {
        emit(ThemeState().copyWith(themeType: ThemeType.light));
      } else {
        emit(
          ThemeState().copyWith(themeType: ThemeType.dark),
        );
      }
    });
  }
}
