import 'dart:convert';
import 'dart:io' hide Platform;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cpit3/src/models/message.dart';
import 'package:rc_cross_platform/rc_cross_platform.dart';

import 'cross_storage_base.dart';

class CrossStorage extends CrossStorageBase {
  static CrossStorage _instance;
  File _file;

  static Future<CrossStorage> get instance async {
    if (_instance == null) {
      final platform = Platform();
      String path;
      if (platform.isMobile) {
        final tmpDirectory = await getTemporaryDirectory();
        path = '${tmpDirectory.path}/storage.json';
      } else if (platform.isDesktop) {
        path = 'storage.json';
      }
      final _file = File(path);
      _instance = CrossStorage._(_file);
    }
    return _instance;
  }

  CrossStorage._(this._file);

  @override
  List<Message> getAllMessages() {
    final parsedJson = _file.readAsStringSync();
    if (parsedJson.isEmpty) {
      return [];
    }
    final map = json.decode(parsedJson) as List;
    return map.map((m) => Message.fromMap(m)).toList();
  }

  @override
  void saveMessage(List<Message> messages) {
    _file.writeAsStringSync(
        json.encode(messages.map((m) => m.toMap()).toList()));
  }

  @override
  void clean() {
    _file.writeAsStringSync('');
  }
}
