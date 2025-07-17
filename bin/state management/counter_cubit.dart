import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit()
    : super(
        0,
      ); // super is used to call the constructor of the parent class and initialize the state to 0

  void increment() => emit(state + 1); // emit is used to emit the new state
  void decrement() => emit(state - 1);
}

void main() {
  final cubit = CounterCubit();
  cubit.stream.listen(print);

  cubit.increment();
  cubit.decrement();
  cubit.decrement();
  cubit.decrement();

  cubit.close();
}
