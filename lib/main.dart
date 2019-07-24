import 'package:flutter/foundation.dart'
    show TargetPlatform, debugDefaultTargetPlatformOverride;
import 'package:flutter/widgets.dart';
import 'package:flutter_cpit3/src/cross_platform/cross_platform.dart';

import 'app.dart';

void main() {
  final platform = CrossPlatform();
  //https://github.com/flutter/flutter/issues/33881
  if (platform.isDesktop) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  runApp(App());
}
