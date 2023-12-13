import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class LottieLoader extends StatelessWidget {
  final String asset;
  final double size;
  final bool? repeat;
  const LottieLoader({required this.asset, required this.size, this.repeat});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      asset,
      width: size,
      height: size,
      animate: true,
      repeat: repeat,
      alignment: Alignment.center,
    );
  }
}
