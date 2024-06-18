import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketScreen extends StatefulWidget {
  const WebSocketScreen({super.key});

  @override
  State<WebSocketScreen> createState() => _WebSocketScreenState();
}

class _WebSocketScreenState extends State<WebSocketScreen> {
  late WebSocketChannel channel;
  late TextEditingController inputController;
  List<String> messages = [];

  @override
  void initState() {
    channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
    inputController = TextEditingController();
    streamListner();
    super.initState();
  }

  void sendData() {
    if (inputController.text.isEmpty) return;
    channel.sink.add(inputController.text);
    inputController.text = "";
  }

  void streamListner() {
    channel.stream.listen((message) {
      if (message.contains('served')) return;
      setState(() {
        messages.add(message);
      });
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Websocket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Form(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: TextField(
                      controller: inputController,
                      decoration: const InputDecoration(
                        labelText: 'Enter Message',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: sendData,
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                    ),
                    child: const Text('Send'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
                child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                messages.add(messages[index]);
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black,
                  ),
                  child: Text(
                    messages[index],
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
