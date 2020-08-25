import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppImageWidget {
  static CachedNetworkImage appImageWidget(String _url) {
    return CachedNetworkImage(
      imageUrl: _url,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
