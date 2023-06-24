import 'package:flutter/material.dart';

class GenieImage extends StatelessWidget {
  final String? image;
  final String? fit;
  const GenieImage({Key? key, required this.image, this.fit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('$image'),
      fit: fit == 'fill'
          ? BoxFit.fill
          : fit == 'contain'
              ? BoxFit.contain
              : fit == 'cover'
                  ? BoxFit.cover
                  : fit == 'fitHeight'
                      ? BoxFit.fitHeight
                      : fit == 'fitWidth'
                          ? BoxFit.fitWidth
                          : fit == 'scaleDown'
                              ? BoxFit.scaleDown
                              : fit == 'none'
                                  ? BoxFit.none
                                  : BoxFit.none,
    );
  }
}
