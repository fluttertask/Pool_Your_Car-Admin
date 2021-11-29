

import 'package:flutter/material.dart';

class SizeConfig {
  final double screenWidth;
  final double screenHeight;
  final Orientation orientation;

  SizeConfig({
    required this.screenWidth,
    required this.screenHeight,
    required this.orientation,
  });

  factory SizeConfig.of(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);

    return SizeConfig(
      screenWidth : _mediaQueryData.size.width,
      screenHeight : _mediaQueryData.size.height,
      orientation : _mediaQueryData.orientation,
    );
  }

  // Get the proportionate height as per screen size
  double getScreenWidth(double inputWidth) {
  //   // 375 is the layout width that designer use
    return (inputWidth / 100) * screenWidth;
  }

    // Get the proportionate height as per screen size
  double getScreenHeight(double inputHeight) {
    // 812 is the layout height that designer use
    return (inputHeight / 100) * screenHeight;
  }
}
