import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Latihan Flutter 2: Bikin Container, Padding, Row dan Column",
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Dashboard",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              backgroundColor: Colors.red,
              centerTitle: true,
              actions: const [
                Icon(Icons.home),
                SizedBox(width: 5),
                Icon(Icons.login),
                SizedBox(width: 5),
              ],
            ),
            body: Container(
              color: Colors.white
            )
          );
  }
}