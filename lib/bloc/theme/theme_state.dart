part of 'theme_bloc.dart';

// class ThemeState extends Equatable {
//   final bool darkMode;
//
//   @override
//   List<Object> get props => [darkMode];
//
//   const ThemeState({required this.darkMode});
//
//   factory ThemeState.initial() {
//     return const ThemeState(darkMode: false);
//   }
//
//   ThemeState copyWith({bool? darkMode}) {
//     return ThemeState(darkMode: darkMode ?? this.darkMode);
//   }
// }

enum AppTheme { light, dark }

class ThemeState extends Equatable {
  final AppTheme appTheme;

  @override
  List<Object> get props => [appTheme];

  const ThemeState({this.appTheme = AppTheme.light});

  factory ThemeState.initial() {
    return const ThemeState();
  }

  @override
  String toString() {
    return 'ThemeState{appTheme: $appTheme}';
  }

  ThemeState copyWith({AppTheme? appTheme}) {
    return ThemeState(appTheme: appTheme ?? this.appTheme);
  }
}
