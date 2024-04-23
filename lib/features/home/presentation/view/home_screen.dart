import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary/core/components/custom_components/custom_loader.dart';
import 'package:gellary/core/components/custom_components/no_data_screen.dart';
import 'package:gellary/features/home/presentation/components/buttons.dart';
import 'package:gellary/features/home/presentation/components/greeting_component.dart';
import 'package:gellary/features/home/presentation/components/home_curve.dart';
import 'package:gellary/features/home/presentation/view_model_manger/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffEBE1FF),
      body: Stack(
        children: [
          CustomPaint(
            painter: HomeCurve(),
            size: size,
          ),
          Column(
            children: [
              const GreetingComponent(),
              const Buttons(),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeGetDataLoading || state is HomeInitial) {
                    return const CustomLoader();
                  } else if (state is HomeGetDataFailed ||
                      (state is HomeGetDataSuccessful &&
                          state.response.data.images.isEmpty)) {
                    return const NoDataScreen();
                  }

                  return Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(15),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15),
                      itemCount: (state as HomeGetDataSuccessful)
                          .response
                          .data
                          .images
                          .length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: const Offset(2, 5),
                                )
                              ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              state.response.data.images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
