import 'package:bloc/bloc.dart';
import 'package:bloc_flutterly/cubits/theme_cubits/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void themeChange(int randInt) {
    if (randInt % 2 == 0) {
      emit(ThemeState().copyWith(themeType: ThemeType.light));
    } else {
      emit(ThemeState().copyWith(themeType: ThemeType.dark));
    }
  }
}
