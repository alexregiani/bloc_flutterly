import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterAddEvent>(addCounter);
    on<CounterSubtractEvent>(subtractCounter);
    on<CounterResetEvent>(resetCounter);
  }

  void addCounter(CounterAddEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(state.counter + event.counter));
  }

  void subtractCounter(event, emit) {
    emit(state.copyWith(state.counter - 1));
  }

  void resetCounter(CounterResetEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(state.counter * 0));
  }
}
