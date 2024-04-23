import 'package:flutter/material.dart';
import 'package:gellary/core/utils/design_utils/app_images.dart';
import 'package:gellary/features/login/presentation/components/background_container.dart';
import 'package:gellary/features/login/presentation/components/login_container.dart';
import 'dart:math' as math;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width * 0.9583;
    double height = size.height * 0.456;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: SweepGradient(
            colors: [
              Color(0xffE798DA),
              Colors.white,
              Color(0xffE798DA),
            ],
            center: Alignment.centerRight,
            transform: GradientRotation(math.pi * 1.28),
          )),
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 55),
                child: Image.asset(
                  AppImages.lovePhotographyIcon,
                  width: 100,
                  height: 100,
                ),
              ),
              Center(
                child: Text(
                  'My',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.7)),
                ),
              ),
              Center(
                child: Text(
                  'Gellary',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.7)),
                ),
              ),
              Center(
                child: Stack(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    BackgroundContainer(height: height, width: width),
                    LoginContainer(height: height, width: width)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
