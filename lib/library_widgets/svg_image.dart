import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  final String image;
  final Color? color;
  final BoxFit? fit;
  final double? height;
  final double? width;

  const SvgImage({required this.image, this.fit, this.color, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    var colorFilter = color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn);
    return SvgPicture.asset(image, colorFilter: colorFilter, fit: fit ?? BoxFit.contain, height: height, width: width);
  }
}
