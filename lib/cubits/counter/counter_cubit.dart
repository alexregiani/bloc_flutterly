import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void increment() {
    print('counter state increment : ${state}');
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {
    print('counter state decrement : $state');
    emit(state.copyWith(counter: state.counter - 1));
  }
}
