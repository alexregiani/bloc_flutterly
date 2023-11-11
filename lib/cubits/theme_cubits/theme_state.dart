import 'package:equatable/equatable.dart';

enum ThemeType { light, dark }

class ThemeState extends Equatable {
  final ThemeType themeType;

  const ThemeState({this.themeType = ThemeType.light});

  factory ThemeState.initial() {
    return ThemeState();
  }

  @override
  List<Object> get props => [themeType];

  @override
  String toString() {
    return 'ThemeState{themeType: $themeType}';
  }

  ThemeState copyWith({ThemeType? themeType}) {
    return ThemeState(themeType: themeType ?? this.themeType);
  }
}
