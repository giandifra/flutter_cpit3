import 'dart:convert';
import 'dart:html';
import 'package:flutter_cpit3/src/models/message.dart';
import 'cross_storage_base.dart';

class CrossStorage extends CrossStorageBase {
  static CrossStorage _instance;

  static Future<CrossStorage> get instance async {
    if (_instance == null) {
      _instance = CrossStorage();
    }
    return _instance;
  }

  @override
  List<Message> getAllMessages() {
    if (!window.localStorage.containsKey('messages')) {
      return [];
    }
    var list = json.decode(window.localStorage['messages']) as List;
    return list.map((m) => Message.fromMap(m)).toList();
  }

  @override
  void saveMessages(List<Message> messages) {
    window.localStorage['messages'] =
        json.encode(messages.map((m) => m.toMap()).toList());
  }

  @override
  void clean() {
    window.localStorage.remove('messages');
  }
}
