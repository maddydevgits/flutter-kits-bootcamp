// experiment5 - Navigation

import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (
      MaterialApp(
        title: 'Experiment-5',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage()
      )
    );
  }
}
