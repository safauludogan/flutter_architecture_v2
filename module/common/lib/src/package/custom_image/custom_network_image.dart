import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/src/package/custom_image/custom_mem_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


@immutable
/// CustomNetworkImage class for image caching
final class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    this.imageUrl,
    this.emptyWidget,
    this.memCache = const CustomMemCache(height: 200, width: 200),
    this.boxFit = BoxFit.cover,
    this.loadingWidget,
    this.size,
  });

  /// Image source address
  final String? imageUrl;

  /// Default value is [BoxFit.cover]
  final BoxFit? boxFit;

  /// Image size
  final Size? size;

  /// When image is loading show this widget if not empty
  final Widget? loadingWidget;

  /// When image is empty show this widget
  final Widget? emptyWidget;

  /// Default value is [CustomMemCache(height: 200, width: 200)]
  final CustomMemCache memCache;
  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    if (url == null || url.isEmpty) {
      return emptyWidget ?? const SizedBox.shrink();
    }
    return CachedNetworkImage(
      imageUrl: url,
      memCacheHeight: memCache.height,
      memCacheWidth: memCache.width,
      fit: boxFit,
      width: size?.width,
      height: size?.height,
      errorListener: (value) {
        if(kDebugMode){
          debugPrint('Error on CustomNetworkImage $value');
        }
      },
      progressIndicatorBuilder: (context, url, progress) =>
          loadingWidget ??
          const Center(
            child: CircularProgressIndicator(),
          ),
      errorWidget: (context, url, error) {
        return emptyWidget ?? const SizedBox.shrink();
      },
    );
  }
}
