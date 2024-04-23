import 'package:flutter/material.dart';
import 'package:gellary/core/utils/app_constants/app_strings.dart';
import 'package:gellary/core/utils/design_utils/app_images.dart';
import 'package:gellary/core/utils/design_utils/app_sizes.dart';
import 'package:lottie/lottie.dart';

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(AppAnimatedImages.noDataAnimation),
          const Text(
            AppStrings.noData,
            style: TextStyle(
                color: Colors.black,
                fontSize: AppSizes.fontSizeExtraLarge,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
