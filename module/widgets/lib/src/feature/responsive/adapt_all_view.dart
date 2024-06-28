import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Make a adaptive view for all platforms
class AdaptAllView extends StatelessWidget {
  /// Define your custom widget for every platform
  /// phone, table, desktop
  const AdaptAllView({
    required this.phone,
    required this.tablet,
    required this.desktop,
    super.key,
  });

  /// PhoneView
  final Widget phone;

  /// TabletView
  final Widget tablet;

  /// DesktopView
  final Widget desktop;
  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isMobile) return phone;
    if (ResponsiveBreakpoints.of(context).isTablet) return tablet;
    if (ResponsiveBreakpoints.of(context).isDesktop) return desktop;

    return desktop;
  }
}
