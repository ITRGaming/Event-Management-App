import 'package:flutter/material.dart';
import 'dart:math';

Color randomColor() {
  Random random = Random();
  int r = random.nextInt(256);
  int g = random.nextInt(256);
  int b = random.nextInt(256);
  return Color.fromRGBO(r, g, b, 1);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            title: const Text('ITR is Op'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: const Icon(Icons.add),
          ),
          body: Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 60),
            ),
          )),
    );
  }

  Type get newMethod => Align;
}
