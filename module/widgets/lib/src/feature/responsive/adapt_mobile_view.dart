import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Make a adaptive view for mobile platforms
class AdaptMobileView extends StatelessWidget {
  /// Define your custom widget for every platform
  /// phone, table
  const AdaptMobileView({
    required this.phone,
    required this.tablet,
    super.key,
  });

  /// MobileView
  final Widget phone;

  /// TabletView
  final Widget tablet;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).isMobile) return phone;
    if (ResponsiveBreakpoints.of(context).isTablet) return tablet;

    return tablet;
  }
}
