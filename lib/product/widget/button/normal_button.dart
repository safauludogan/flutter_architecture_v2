import 'package:flutter/material.dart';
import 'package:flutter_weefit/product/utility/constants/project_radius.dart';

/// Radius is 20
final class NormalButton extends StatelessWidget {
  const NormalButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  /// Title text
  final String title;

  /// Button on pressed
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      radius: ProjectRadius.normal.value,
      child: Text(title),
    );
  }
}
