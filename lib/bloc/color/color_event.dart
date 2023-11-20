part of 'color_bloc.dart';

abstract class ColorEvent extends Equatable {
  const ColorEvent();
}

class ColorChangeEvent extends ColorEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
