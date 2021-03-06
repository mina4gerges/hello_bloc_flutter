import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_bloc_flutter/logic/cubit/counter_cubit.dart';
import 'package:hello_bloc_flutter/presentation/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<CounterCubit>(context),
                      child: SecondScreen(
                        title: 'Second Screen',
                      ),
                    ),
                  ),
                );
              },
              child: Text("Go to second page"),
            ),
            BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.wasIncremented == false
                        ? 'Incremented'
                        : 'Decremented!',
                  ),
                  duration: Duration(
                    milliseconds: 300,
                  ),
                ),
              );
            }, builder: (context, state) {
              return Text(
                state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () =>
                  BlocProvider.of<CounterCubit>(context).increment(),
              // onPressed: () => context.read<CounterCubit>().increment(),
              tooltip: 'Increment',
              heroTag: "btn1",
              child: Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              // onPressed: () => BlocProvider.of<CounterCubit>(context).decrement(),
              onPressed: () => context.read<CounterCubit>().decrement(),
              heroTag: "btn2",
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}
