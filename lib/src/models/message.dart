import 'package:intl/intl.dart' show DateFormat;

class Message {
  final MessageType type;
  final String text;
  final DateTime date;

  Message({this.type, this.text, this.date});

  String get dateFormatted => DateFormat("h:m").format(date);
}

enum MessageType {
  BOT,
  USER,
}
