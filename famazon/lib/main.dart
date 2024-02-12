import 'package:famazon/contsants/global_variables.dart';
import 'package:famazon/features/auth/screens/auth_screen.dart';
import 'package:famazon/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'famazon',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => gererateRoute(settings),
      home: const AuthScreen(),
    );
  }
}
