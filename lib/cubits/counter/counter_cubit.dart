import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial(counter: 0));

  void increment() {
    print('$state');
    // print('counter state increment : $state');

    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {

    print('$state');

    // print('counter state decrement : $state');

    emit(state.copyWith(counter: state.counter - 1));
  }
}
