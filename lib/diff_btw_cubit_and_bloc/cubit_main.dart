import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}

// void main(List<String> args) {
//   final cubit = CounterCubit();
//
//   print(cubit.state);
//
//   cubit.increment();
//
//   print(cubit.state);
//
//   cubit.increment();
//
//   print(cubit.state);
//
//   cubit.decrement();
//
//   print(cubit.state);
//
//   cubit.close();
// }

Future<void> main(List<String> args) async {
  final cubit = CounterCubit();

  // This subscribe to the cubit state stream and prints the state values
  // emitted by it
  final streamSubscription = cubit.listen(print);

  cubit.increment();

  cubit.increment();

  cubit.decrement();

  // We use this to not cancel the subscription immediately
  await Future.delayed(Duration.zero);

  streamSubscription.cancel();

  cubit.close();
}
