import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageUtils {
  static Widget networkImage({
    required String imageURL,
    String? cacheKey,
    double? height,
    double? width,
    Color? color,
  }) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      cacheKey: cacheKey,
      height: height,
      width: width,
      color: color,
    );
  }
}
