part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({required this.counter});

  factory CounterState.initial({required int counter}) {
    if (counter == 0) {
      print('counter 0 yei');
    }
    return const CounterState(counter: 0);
  }

  @override
  List<Object> get props => [counter];

  @override
  String toString() {
    return 'counter: $counter';
  }

  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }
}
