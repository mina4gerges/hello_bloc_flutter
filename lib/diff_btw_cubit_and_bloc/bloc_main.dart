import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBlOC extends Bloc<CounterEvent, int> {
  CounterBlOC() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
      default:
        throw UnimplementedError();
    }
  }
}

Future<void> main(List<String> args) async {
  final bloc = CounterBlOC();

  // This subscribe to the cubit state stream and prints the state values
  // emitted by it
  final streamSubscription = bloc.listen(print);

  bloc.add(CounterEvent.increment);

  bloc.add(CounterEvent.increment);

  bloc.add(CounterEvent.decrement);

  // We use this to not cancel the subscription immediately
  await Future.delayed(Duration.zero);

  streamSubscription.cancel();

  bloc.close();
}
