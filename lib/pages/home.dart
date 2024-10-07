import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: SizedBox.expand(),
            ),
          ],
        ),
      ),
    );
  }
}
