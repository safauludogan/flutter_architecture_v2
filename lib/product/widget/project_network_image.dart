import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

/// Network image with [Lottie] loading
class ProjectNetworkImage extends StatelessWidget {
  const ProjectNetworkImage({required this.url, this.size, super.key});

  final String url;
  final Size? size;
  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      imageUrl: url,
      size: size,
      loadingWidget: Assets.lottie.animHello.lottie(
        package: 'gen',
      ),
    );
  }
}
