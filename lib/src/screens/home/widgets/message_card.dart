import 'package:flutter/material.dart';
import 'package:flutter_cross_platform/src/models/message.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: message.type == MessageType.BOT
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: ShapeDecoration(
            color: message.type == MessageType.BOT ? Colors.blue : Colors.pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: message.type == MessageType.BOT
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                constraints:
                    BoxConstraints.loose(MediaQuery.of(context).size * 0.8),
                child: Text(
                  message.text,
                  style: TextStyle(color: Colors.white, fontSize: 17.0),
                ),
              ),
              Text(
                message.dateFormatted,
                style: TextStyle(color: Colors.grey[300], fontSize: 12.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
