import 'package:flutter/material.dart';
import 'package:flutter_cross_platform/src/models/message.dart';
import 'package:http/http.dart' as http;

import 'home/widgets/message_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Message> chatMessages = [];

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DialogFlow chat"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              reverse: true,
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return MessageCard(
                  message: chatMessages[index],
                );
              },
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: textEditingController,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  final text = textEditingController.text;
                  textEditingController.clear();
                  final myMessage = Message(
                    text: text,
                    date: DateTime.now(),
                    type: MessageType.USER,
                  );
                  setState(() {
                    chatMessages.insert(0, myMessage);
                  });
                  sendRequest(textEditingController.text);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void sendRequest(String text) async {
    var url = 'https://adventurous-structure.glitch.me/send';
    var response = await http.post(
      url,
      body: {'text': text},
    );
    print(response.request);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final botMessage = Message(
          type: MessageType.BOT, text: response.body, date: DateTime.now());
      setState(() {
        chatMessages.insert(0, botMessage);
      });
    }
  }
}
