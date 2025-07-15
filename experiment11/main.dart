// Experiment11 - API in Flutter

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'API Demo',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: APIHomePage(),
    ));
  }
}

// Create a Model of What we want to fetch from API
class User {
  final int id;
  final String name;
  final String email;

  // Primary Constructor
  User({required this.id, required this.name, required this.email});

  // Factory Constructor
  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name'], email: json['email']);
  }
}

class APIHomePage extends StatefulWidget {
  const APIHomePage({super.key});

  @override
  State<APIHomePage> createState() => _APIHomePageState();
}

class _APIHomePageState extends State<APIHomePage> {
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    users = fetchUsers();
  }

  Future<List<User>> fetchUsers() async {
    final response = await http.get(
      Uri.parse('http://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fetching API Response')),
      body: FutureBuilder<List<User>>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final userList = snapshot.data!;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final user = userList[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(child: Text(user.id.toString())),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No Data Found'));
          }
        },
      ),
    );
  }
}
