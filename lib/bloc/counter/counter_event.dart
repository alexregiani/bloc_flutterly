part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class CounterAddEvent extends CounterEvent {
  final int counter;

  const CounterAddEvent({required this.counter});

  @override
  List<Object> get props => [counter];
}

class CounterSubtractEvent extends CounterEvent {
  @override
  List<Object> get props => [];
}

class CounterResetEvent extends CounterEvent {
  @override
  List<Object> get props => [];
}