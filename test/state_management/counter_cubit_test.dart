import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

import '../../bin/state management/counter_cubit.dart';

void main() {
  group('Counter Cubit Tests', () {
    late CounterCubit cubit; // late for lazy initialization

    setUp(() {
      // run before each test, for setup
      cubit = CounterCubit();
    });

    tearDown(() {
      // run after each test, for clean up
      cubit.close();
    });

    test('initial state should be 0', () {
      expect(cubit.state, equals(0));
    });

    blocTest<CounterCubit, int>(
      'emits [1] when increment is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => [1],
    );
    blocTest<CounterCubit, int>(
      'emits [-1] when decrement is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () => [-1],
    );

    blocTest<CounterCubit, int>(
      'emits [1, 0, -1, -2] when increment then 3x decrement called',
      build: () => CounterCubit(),
      act: (cubit) {
        cubit.increment();
        cubit.decrement();
        cubit.decrement();
        cubit.decrement();
      },
      expect: () => [1, 0, -1, -2],
    );
  });
}
