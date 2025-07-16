// Experiment-12

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Counter Demo', home: CounterScreen());
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterState();
}

class _CounterState extends State<CounterScreen> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times: '),
            Text('$counter'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: increment,
              key: Key('incrementButton'),
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
