import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterAddEvent>(_addCounter, transformer: droppable());
    on<CounterSubtractEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 5));
      emit(state.copyWith(state.counter - 1));
    });
  }

  void _addCounter(event, emit) async {
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(state.counter + 1));
  }
}
