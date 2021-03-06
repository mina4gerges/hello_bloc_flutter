import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/counter_cubit.dart';

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
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Column(
              children: [
                ElevatedButton(
                  child: Text("Go to second screen"),
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/secondScreen'),
                ),
                ElevatedButton(
                  child: Text("Go to third screen"),
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/thirdScreen'),
                ),
              ],
            ),
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
