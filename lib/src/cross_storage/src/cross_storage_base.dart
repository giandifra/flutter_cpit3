import 'package:flutter_cross_platform/src/models/message.dart';

abstract class CrossStorageBase {
  Message getMessage(String id);
  List<Message> getAllMessages();
  void saveMessage();
}