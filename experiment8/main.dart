// Experiment8 - Create Custom Widgets

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Widgets Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

// Home screen widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Widgets')),
      body: ListView(
        children: [
          CustomWidget(
            title: 'Widget 1',
            description: 'This is the first custom widget.',
            icon: Icons.star,
          ),
          SizedBox(height: 10), // Add some spacing between widgets
          CustomWidget(
            title: 'Widget 2',
            description: 'This is the second custom widget.',
            icon: Icons.favorite,
          ),
          SizedBox(height: 10), // Add some spacing between widgets
          CustomWidget(
            title: 'Widget 3',
            description: 'This is the third custom widget.',
            icon: Icons.thumb_up,
          ),
          SizedBox(height: 10), // Add some spacing between widgets
          CustomWidget(
            title: 'Widget 4',
            description: 'This is the fourth custom widget.',
            icon: Icons.check_circle,
          ),
        ],
      ),
    );
  }
}

// Custom widget which will be reused based on the parameters
class CustomWidget extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const CustomWidget({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.orange),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        subtitle: Text(description),
      ),
    );
  }
}
