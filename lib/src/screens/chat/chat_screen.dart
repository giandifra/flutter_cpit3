import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cpit3/src/cross_storage/cross_storage.dart';
import 'package:flutter_cpit3/src/models/bot_response_body.dart';
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
  String sessionId = '';

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    _crossStorage = await CrossStorage.instance;
    _textEditingController = TextEditingController();

    // Aggiorno lo stato del widget inserendo nella lista i messaggi salvati in locale
    setState(() {
      chatMessages = _crossStorage.getAllMessages();
    });
    print(chatMessages.length);
  }

  Future<bool> _onWillPop() async {

    // Salvo i messaggi in memoria locale
    _crossStorage.saveMessages(chatMessages);
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

                    // Resetto il form
                    final text = _textEditingController.text;

                    // Controllo se il form non sia vuoto
                    if (text.isNotEmpty) {
                      _textEditingController.clear();
                      final myMessage = Message(
                        text: text,
                        date: DateTime.now(),
                        type: MessageType.USER,
                      );

                      // Aggiorno lo stato del widget inserendo il messaggio inviato
                      // nella lista di messaggi
                      setState(() {
                        chatMessages.insert(0, myMessage);
                      });

                      // invio la richiesta al bot e processo il risultato
                      sendRequestAndProcessResponse(text);
                    } else {

                      // Mostro un popup per informare la mancanza di testo nel form
                      showPopup(context, 'Campo di testo vuoto');
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

  void sendRequestAndProcessResponse(String text) async {
    try {

      // Parametri della query
      final Map<String, String> queryParameters = {
        'text': text,
        'sessionId': sessionId,
      };

      // Uri
      final uri = Uri.https(
          'adventurous-structure.glitch.me', '/send', queryParameters);
      print(uri.queryParameters.toString());

      // Effettuo la richiesta HTTP POST
      final http.Response response = await http.post(
        uri,
      );

      print(response.request);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Se lo stato della richiesta è 200
      if (response.statusCode == 200) {
        final BotResponseBody botResponseBody =
            BotResponseBody.fromMap(json.decode(response.body));

        // Salvo la sessionId
        sessionId = botResponseBody.sessionId;

        // Creo l'oggetto [Message] contentente le informazioni del messaggio ricevuto
        final botMessage = Message(
            type: MessageType.BOT,
            text: botResponseBody.text,
            date: DateTime.now());

        // Aggiorno lo stato della schermata [ChatScreen]
        // inserendo il messaggio ricevuto nella lista dei messaggi
        setState(() {
          chatMessages.insert(0, botMessage);
        });
      } else {

        // Mostro un popup con l'errore
        showPopup(context, response.body);
      }
    } catch (e) {

      // Mostro un popup con l'errore in caso di sollevamento di un eccezione
      showPopup(context, e.toString());
    }
  }

  // Mostro un popup a schermo
  showPopup(BuildContext context, String error) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'ERRORE',
              style: TextStyle(color: Colors.red),
            ),
            content: Text(error),
          );
        });
  }
}
