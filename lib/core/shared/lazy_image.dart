import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Widget para lazy loading de imágenes locales y de red.
class LazyImage extends StatefulWidget {
  final String imagePath;
  final bool isAsset;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? placeholder;

  const LazyImage({
    super.key,
    required this.imagePath,
    this.isAsset = false,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.placeholder,
  });

  @override
  State<LazyImage> createState() => _LazyImageState();
}

class _LazyImageState extends State<LazyImage> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.imagePath),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: _isVisible
          ? widget.isAsset
              ? Image.asset(
                  widget.imagePath,
                  fit: widget.fit,
                  width: widget.width,
                  height: widget.height,
                )
              : Image.network(
                  widget.imagePath,
                  fit: widget.fit,
                  width: widget.width,
                  height: widget.height,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return widget.placeholder ?? Center(child: CircularProgressIndicator());
                  },
                )
          : widget.placeholder ?? Container(color: Colors.grey[200], width: widget.width, height: widget.height),
    );
  }
} 