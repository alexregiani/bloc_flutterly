import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterAddEvent>((event, emit) {
      emit(state.copyWith(state.counter + event.counter));
    });
    on<CounterSubtractEvent>((event, emit) {
      emit(state.copyWith(state.counter - 1));
    }, transformer: concurrent());
    on<CounterResetEvent>(resetCounter, transformer: concurrent());
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
