import 'package:flutter/material.dart';
import 'package:gellary/core/utils/design_utils/app_images.dart';

import 'blurred_image.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer(
      {super.key, required this.height, required this.width});

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: height,
      width: width,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlurredImage(AppImages.loginRectangleIcon),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  BlurredImage(AppImages.loginYellowCircleIcon),
                  BlurredImage(AppImages.loginWhiteCircleIcon),
                  Positioned(
                      left: 25,
                      top: 20,
                      child: BlurredImage(AppImages.loginWhiteCircleIcon)),
                  Positioned(
                      left: 55,
                      top: 35,
                      child: BlurredImage(AppImages.loginWhiteCircleIcon)),
                ],
              ),
            ],
          ),
          BlurredImage(AppImages.loginRectangleIcon),
        ],
      ),
    );
  }
}
