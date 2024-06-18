import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_chatbot/whatsapp_chatbot.dart';

class WhatsappChatbot extends StatefulWidget {
  const WhatsappChatbot({super.key});

  @override
  State<WhatsappChatbot> createState() => _WhatsappChatbotState();
}

class _WhatsappChatbotState extends State<WhatsappChatbot> {
  final settings = Config(
    botDelay: 0,
    waitText: 'Bot Thinking...',
    defaultResponseMessage: "Sorry! I didn't catch that!\nPlease try again!",
    keywords: [
      'hello',
      'hi',
      'how are you',
      'view receipt',
      'delete receipt',
    ],
    response: [
      'Hi\nHow can I assist you today?',
      'Hello!\nHow can I be of help?',
      'I am doing great!',
      'Go to receipt screen to view your receipts',
      'Go to receipt screen\nlong press on a receipt\npress the delete icon',
    ],
    greetings: "Hi there👋🏾\nHow can I help you?",
    headerText: 'Receipt Branch',
    subHeaderText: 'Online',
    buttonText: 'Start Chat',
    buttonColor: const Color.fromARGB(255, 73, 4, 4),
    chatIcon: const Icon(Icons.person),
    headerColor: const Color.fromARGB(255, 73, 4, 4),
    message: 'Hello! This is a direct WhatsApp message.',
    phoneNumber: '+918238484230',
    chatBackgroundColor: const Color.fromARGB(255, 238, 231, 223),
    onlineIndicator: const Color.fromARGB(255, 37, 211, 102),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Whatsapp Chatbot'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(child: WhatsappChatBot(settings: settings)),
          ],
        ),
      ),
    );
  }
}


//https://pub.dev/packages/whatsapp_chatbot