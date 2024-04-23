import 'package:flutter/material.dart';
import 'package:gellary/core/utils/app_constants/app_constants.dart';
import 'package:gellary/core/utils/design_utils/app_images.dart';
import 'package:gellary/core/utils/design_utils/app_sizes.dart';
import 'package:gellary/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GreetingComponent extends StatelessWidget {
  const GreetingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(fontSize: AppSizes.fontSizeOverOverLarge,),
              ),
              Text(
                sl
                    .get<SharedPreferences>()
                    .getString(AppConstants.currentUserName)!,
                style: const TextStyle(fontSize: AppSizes.fontSizeOverOverLarge,),
              ),
            ],
          ),
          CircleAvatar(
            radius: 38,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                AppImages.userImage,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
