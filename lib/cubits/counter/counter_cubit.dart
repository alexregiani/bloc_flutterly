import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial(counter: 0));

  void increment() {
    print('$state');
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {
    print('$state');
    emit(state.copyWith(counter: state.counter - 1));
  }
}
