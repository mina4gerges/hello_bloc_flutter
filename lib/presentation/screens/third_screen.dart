import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  ThirdScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ThirdScreen createState() => _ThirdScreen();
}

class _ThirdScreen extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
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
              // onPressed: () => BlocProvider.of<CounterCubit>(context).increment(),
              onPressed: () => context.read<CounterCubit>().increment(),
              heroTag: "btn3",
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
