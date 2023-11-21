part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class CounterChangeEvent extends CounterEvent {
  const CounterChangeEvent();

  @override
  List<Object> get props => [];
}
