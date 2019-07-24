import 'package:flutter_cpit3/src/models/message.dart';

abstract class CrossStorageBase {
  List<Message> getAllMessages();
  void saveMessage(List<Message> messages);
  void clean();
}