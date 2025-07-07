// Demonstration of Stateful Widget

// What is Stateless Widget ?

// What is Stateful Widget ?

// What is Widget ? is a component which has a built-in code

// In flutter, everything is a widget

// Stateless Widget, and Stateful Widget

// no-state then widget is stateless widget

// state then widget is stateful widget

// if your widget is completely static, stateless widget

// if your widget is dynamic, stateful widget

// stateful widget can transport data to other widgets in the same screen

// zomato or swiggy application in one screen (different widget)

// when i click on add, on bottom of the screen (1 item has added to cart)

import 'package:flutter/material.dart';

void main() {
  // main function will be called first
  // define what is the root widget
  runApp(MyApp()); // calling the root widget
}

// Widget-1: Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // unique key will be assigned to widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Stateful Widget Demo', home: HomeScreen());
  }
}

// Widget-2: HomeScreen Widget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key}); // unique key

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// class _HomeScreenState
class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  // function definition
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  // basic text (static -> Your value is ), dynamic text (counter value), button
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Demo'),
        backgroundColor: const Color.fromARGB(255, 158, 195, 226),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your value is ', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text('$counter', style: TextStyle(fontSize: 28)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: incrementCounter,
              child: Text('Increment Button'),
            ),
          ],
        ),
      ),
    );
  }
}
