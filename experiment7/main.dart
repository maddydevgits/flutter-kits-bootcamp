// activity related to provider management

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// main function to run the app
void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => CounterProvider(), child: MyApp()),
  );
}

// We have to define the root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // key is used to identify the widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterPage(),
    );
  }
}

// CounterPage widget that displays the counter
class CounterPage extends StatelessWidget {
  const CounterPage({super.key}); // key is used to identify the widget

  @override
  Widget build(BuildContext context) {
    // Access the CounterProvider using Provider.of
    final counter = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter Value:', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text('${counter.value}', style: TextStyle(fontSize: 48)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: counter.increment,
              child: Text('Increment'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// CounterProvider class that extends ChangeNotifier
class CounterProvider extends ChangeNotifier {
  int value = 0; // private variable to hold the counter value

  // Method to increment the counter
  void increment() {
    value++;
    notifyListeners(); // notify listeners about the change
  }
}

// listening is nothing but receiving the changes in the dynamic data
