part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class CounterAddEvent extends CounterEvent {
  const CounterAddEvent();

  @override
  List<Object> get props => [];
}

class CounterSubtractEvent extends CounterEvent {
  @override
  List<Object> get props => [];
}