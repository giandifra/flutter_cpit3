import 'package:flutter/material.dart';
import 'package:flutter_cpit3/src/models/message.dart';

import 'message_card.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return MessageCard(
          message: messages[index],
        );
      },
    );
  }
}
