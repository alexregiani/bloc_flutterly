part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final bool darkMode;

  @override
  List<Object> get props => [darkMode];

  const ThemeState({
    required this.darkMode,
  });

  factory ThemeState.initial() {
    return const ThemeState(darkMode: true);
  }

  ThemeState copyWith({
    bool? darkMode,
  }) {
    return ThemeState(
      darkMode: darkMode ?? this.darkMode,
    );
  }
}
