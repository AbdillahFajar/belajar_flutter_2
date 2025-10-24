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
              // color: Colors.amberAccent,
              alignment: Alignment.center, //Atur posisi child punya container tapi gak ngatur isi dari child tersebut
              width: 100,
              height: 100,
              // child: 
              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(Icons.login),
              //       SizedBox(width: 5),
              //       Icon(Icons.logout),
              //       SizedBox(width: 5),
              //       Text("I have no idea, what am i doing.")
              //     ],
              //   ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.red,
                                    Colors.green,
                                  ],
                                ),
              ),
            )
          );
  }
}