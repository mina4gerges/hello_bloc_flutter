import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_bloc_flutter/cubit/counter_cubit.dart';

void main() {
  group('counter state test', () {
    CounterCubit counterCubit;

    setUp(() => counterCubit = CounterCubit());

    tearDown(() => counterCubit.close());

    test("initial value should be zero", () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });


    blocTest('increment value by one',
        build: () => counterCubit,
        act: (cubit) => cubit.increment(),
        expect: [CounterState(counterValue: 1)]);

    blocTest('decrement value by one',
        build: () => counterCubit,
        act: (cubit) => cubit.decrement(),
        expect: [CounterState(counterValue: -1)]);
  });
}
