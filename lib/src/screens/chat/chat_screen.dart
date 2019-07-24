import 'package:flutter/material.dart';
import 'package:flutter_cpit3/src/cross_storage/cross_storage.dart';
import 'package:flutter_cpit3/src/models/message.dart';
import 'package:flutter_cpit3/src/screens/chat/widgets/message_card.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> chatMessages = [];
  CrossStorage _crossStorage;

  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    _crossStorage = await CrossStorage.instance;
    _textEditingController = TextEditingController();
    setState(() {
      chatMessages = _crossStorage.getAllMessages();
    });
    print(chatMessages.length);
  }

  Future<bool> _onWillPop() async {
    _crossStorage.saveMessage(chatMessages);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("DialogFlow chat"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _crossStorage.clean();
                setState(() {
                  chatMessages.clear();
                });
              },
            ),
          ],
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
                      controller: _textEditingController,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final text = _textEditingController.text;
                    if (text.isNotEmpty) {
                      _textEditingController.clear();
                      final myMessage = Message(
                        text: text,
                        date: DateTime.now(),
                        type: MessageType.USER,
                      );
                      setState(() {
                        chatMessages.insert(0, myMessage);
                      });
                      sendRequest(text);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void sendRequest(String text) async {
    try {
      final Map<String, String> queryParameters = {
        'text': text,
      };
      final uri = Uri.https(
          'adventurous-structure.glitch.me', '/send', queryParameters);
      print(uri.queryParameters.toString());
      final response = await http.post(
        uri,
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
      } else {
        showPopup(context, 'Status code: ${response.statusCode}');
      }
    } catch (e) {
      showPopup(context, e.toString());
    }
  }

  showPopup(BuildContext context, String error) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Si è verificato un errore'),
            content: Text(error),
          );
        });
  }
}
