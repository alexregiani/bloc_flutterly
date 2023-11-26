part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class DarkThemeSwitchEvent extends ThemeEvent {
  @override
  List<Object> get props => [];
}

class LightThemeSwitchEvent extends ThemeEvent {
  @override
  List<Object> get props => [];
}
