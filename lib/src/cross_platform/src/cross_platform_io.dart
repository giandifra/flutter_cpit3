import 'cross_platform_base.dart';
import 'dart:io' show Platform;

class CrossPlatform extends CrossPlatformBase {
  CrossPlatform()
      : super(
          isDesktop: Platform.isWindows ||
              Platform.isLinux ||
              Platform.isMacOS ||
              Platform.isFuchsia,
          isMobile: Platform.isAndroid || Platform.isIOS,
        );
}
