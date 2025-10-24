import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bikin Splash Screen Sederhana",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, //standar desain android terbaru
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber)
      ),
      home: SplashScreen()
    );
  }
}

