import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int incrementSize = 1;

  CounterCubit() : super(CounterState.initial());

  void counterIncrease(int incrementSize) {
    emit(state.copyWith(state.counter + incrementSize));
    print('${state.counter}');
  }

  void reset() {
    emit(state.copyWith(state.counter * 0));
  }
}
