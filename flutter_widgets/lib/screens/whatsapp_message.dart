import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsappMessage extends StatefulWidget {
  const WhatsappMessage({super.key});

  @override
  State<WhatsappMessage> createState() => _WhatsappMessageState();
}

class _WhatsappMessageState extends State<WhatsappMessage> {
  String number = "";
  String message = "";
  String countryCode = "91";

  Future<void> _launchWhatsApp() async {
    //const String tempUrl = "https://flutter.dev";
    final String url =
        'https://wa.me/$countryCode$number?text=${Uri.encodeComponent(message)}';
    await canLaunchUrl(Uri.parse(url))
        ? launchUrl(Uri.parse(url))
        : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whatsapp Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CountryCodePicker(
              onChanged: (value) {
                setState(() {
                  countryCode = value.toString().substring(1);
                });
              },
              initialSelection: 'IN',
              favorite: const ['+91', 'IN'],
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  number = value;
                });
              },
              decoration: const InputDecoration(
                hintText: "Number",
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  message = value;
                });
              },
              decoration: const InputDecoration(
                hintText: "Message",
                enabledBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: _launchWhatsApp, child: const Text("Send")),
          ],
        ),
      ),
    );
  }
}


// https://faq.whatsapp.com/5913398998672934/?helpref=uf_share
// https://www.youtube.com/watch?v=zWjCOHM8Lz4&t=1s