import 'dart:io';

import 'package:app/constants/colors.dart';
import 'package:app/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var iosLoader = const CupertinoActivityIndicator(color: primary, radius: 20);
    var circleLoader = CircularProgressIndicator(color: primary, backgroundColor: primary.withOpacity(0.3));
    var androidLoader = SizedBox(height: 36, width: 36, child: circleLoader);
    return Container(
      width: SizeConfig.width,
      height: SizeConfig.height,
      alignment: Alignment.center,
      color: white.withOpacity(0.6),
      child: Platform.isIOS ? iosLoader : androidLoader,
    );
  }
}
