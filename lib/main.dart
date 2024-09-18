import 'package:appadsgp1/view/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.deepPurple
            ),
            foregroundColor: MaterialStatePropertyAll(
              Colors.black
            )
          )
        ),
        inputDecorationTheme: const InputDecorationTheme(
          errorStyle: TextStyle(color: Colors.deepPurple)
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
          background: Colors.grey[100],
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
