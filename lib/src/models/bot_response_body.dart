class BotResponseBody {
  final String sessionId;
  final String text;

  BotResponseBody.fromMap(Map<String, dynamic> map)
      : this.text = map['text'],
        this.sessionId = map['sessionId'];
}