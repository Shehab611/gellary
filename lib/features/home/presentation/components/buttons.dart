import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary/core/utils/design_utils/app_images.dart';
import 'package:gellary/core/utils/design_utils/app_sizes.dart';
import 'package:gellary/features/home/presentation/view_model_manger/home_cubit.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  cubit.logout(context);
                },
                icon: const IconContainer(
                  backgroundImage: AppImages.logoutBackground,
                  icon: AppImages.logoutArrow,
                ),
                label: const Text(
                  'log out',
                  style: TextStyle(
                      fontSize: AppSizes.fontSizeExtraLarge,
                      color: Colors.black),
                )),
            ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.white70,
                        child: SizedBox(
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  cubit.pickImage(false, context);
                                },
                                label: const Text(
                                  'Gellary',
                                  style: TextStyle(
                                      fontSize: AppSizes.fontSizeExtraLarge,
                                      color: Colors.black45),
                                ),
                                icon: Image.asset(AppImages.galleryIcon),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  cubit.pickImage(true, context);
                                },
                                label: const Text(
                                  'Camera',
                                  style: TextStyle(
                                      fontSize: AppSizes.fontSizeExtraLarge,
                                      color: Colors.black45),
                                ),
                                icon: Image.asset(
                                  AppImages.cameraIcon,
                                  width: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const IconContainer(
                  backgroundImage: AppImages.uploadBackground,
                  icon: AppImages.uploadArrow,
                ),
                label: const Text(
                  'upload',
                  style: TextStyle(
                      fontSize: AppSizes.fontSizeExtraLarge,
                      color: Colors.black),
                )),
          ],
        );
      },
    );
  }
}

class IconContainer extends StatelessWidget {
  const IconContainer(
      {super.key, required this.backgroundImage, required this.icon});

  final String backgroundImage, icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(backgroundImage))),
      child: Image.asset(
        icon,
      ),
    );
  }
}
