import 'package:intl/intl.dart' show DateFormat;

class Message {
  final MessageType type;
  final String text;
  final DateTime date;

  Message({this.type, this.text, this.date});

  Message.fromMap(Map<String, dynamic> map)
      : this.text = map['text'],
        this.type = MessageType.values[map['type']],
        this.date = DateTime.fromMillisecondsSinceEpoch(map['timestamp']);

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['text'] = this.text;
    map['type'] = this.type.index;
    map['timestamp'] = this.date.millisecondsSinceEpoch;
    return map;
  }

  String get dateFormatted => DateFormat("hh:mm").format(date);
}

enum MessageType {
  BOT,
  USER,
}
