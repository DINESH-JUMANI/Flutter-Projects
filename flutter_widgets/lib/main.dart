import 'package:flutter/material.dart';
import 'package:flutter_widgets/screens/whatsapp_chatbot.dart';
import 'package:flutter_widgets/screens/whatsapp_message.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WhatsappChatbot(),
    );
  }
}
