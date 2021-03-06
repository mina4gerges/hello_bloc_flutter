import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './logic/cubit/counter_cubit.dart';
import './presentation/screens/home_screen.dart';
import './presentation/screens/second_screen.dart';
import './presentation/screens/third_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => BlocProvider.value(
              value: _counterCubit,
              child: HomeScreen(title: 'Home Screen'),
            ),
        '/secondScreen': (_) => BlocProvider.value(
              value: _counterCubit,
              child: SecondScreen(title: 'Second Screen'),
            ),
        '/thirdScreen': (_) => BlocProvider.value(
              value: _counterCubit,
              child: ThirdScreen(title: 'Third Screen'),
            ),
      },
    );
  }
}
