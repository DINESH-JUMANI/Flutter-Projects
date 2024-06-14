import 'package:flutter/material.dart';
import 'package:whatsapp/whatsapp.dart';

class WhatsappBusiness extends StatefulWidget {
  const WhatsappBusiness({super.key});

  @override
  State<WhatsappBusiness> createState() => _WhatsappBusinessState();
}

class _WhatsappBusinessState extends State<WhatsappBusiness> {
  WhatsApp whatsApp = WhatsApp();
  initializeWP() {
    whatsApp.setup();
    whatsApp.short(to: 918238484230, message: 'Hello', compress: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whatsapp Business'),
      ),
      body: const Center(
        child: Text('Whatsapp Business'),
      ),
    );
  }
}
