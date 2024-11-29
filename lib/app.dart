import 'package:flutter/material.dart';
import 'package:ludum_dare_56/pages/game.dart';
import 'package:ludum_dare_56/pages/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 48,
          ),
          headlineMedium: TextStyle(
            fontSize: 72,
          ),
          headlineLarge: TextStyle(
            fontSize: 108,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(
              Size(0.3 * size.width, 80),
            ),
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                fontSize: 24.0,
              )
            ),
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
