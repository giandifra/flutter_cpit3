abstract class CrossPlatformBase {
  final bool isDesktop;
  final bool isMobile;
  final bool isWeb;

  CrossPlatformBase({
    this.isDesktop = false,
    this.isMobile = false,
    this.isWeb = false,
  });
}
