part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class CounterChangeEvent extends CounterEvent {
  final int counter;

  const CounterChangeEvent(this.counter);

  @override
  List<Object> get props => [counter];
}
