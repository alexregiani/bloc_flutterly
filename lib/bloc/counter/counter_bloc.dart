import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterAddEvent>((event, emit) {
      // print('before change $state');
      emit(state.copyWith(state.counter + 1));
      // print('after change $state');
    });
    on<CounterSubtractEvent>((event, emit) {
      emit(state.copyWith(state.counter - 1));
    });
  }
}
