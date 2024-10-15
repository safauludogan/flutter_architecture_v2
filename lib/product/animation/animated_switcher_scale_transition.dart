import 'package:flutter/material.dart';

@immutable

/// AnimatedSwitcher with ScaleTransition and FadeTransition
final class CustomAnimatedSwitcher extends StatelessWidget {
  const CustomAnimatedSwitcher({
    required this.firstChild,
    required this.secondChild,
    required this.doAnimate,
    required this.duration,
    super.key,
  });

  /// The widget that will appear before the animation starts.
  final Widget firstChild;

  /// The widget that will appear after the animation starts.
  final Widget secondChild;

  /// Do it animate with [doAnimate]
  final bool doAnimate;

  /// Animation duration
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: Curves.easeInOutBack,
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.8, end: 1).animate(animation),
            child: child,
          ),
        );
      },
      child: !doAnimate
          ? SizedBox(
              key: const ValueKey('firstChild'),
              child: firstChild,
            )
          : SizedBox(
              key: const ValueKey('secondChild'),
              child: secondChild,
            ),
    );
  }
}
