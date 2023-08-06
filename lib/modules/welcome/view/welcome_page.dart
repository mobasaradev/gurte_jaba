import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gurte_jaba/modules/cubit/app_cubit.dart';
import 'package:gurte_jaba/modules/modules.dart';
import 'package:gurte_jaba/theme/theme.dart';
import 'package:gurte_jaba/utils/utils.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final images = [
    AssetPaths.welcome1,
    AssetPaths.welcome2,
    AssetPaths.welcome3,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  images[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(
                top: 150,
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trips",
                        style: AppTextTheme.common.headlineLarge,
                      ),
                      Text(
                        "Mountain",
                        style: AppTextTheme.common.headlineMedium,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 250,
                        child: Text(
                          "Traveling the road will tell you more about the road than the google will tell you about the road.",
                          style: AppTextTheme.common.bodySmall?.copyWith(
                            color: AppColorTheme.textColor2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomButton(
                        widget: 120,
                        onTap: () {
                          BlocProvider.of<AppCubit>(context).getData();
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      3,
                      (indexDots) => Container(
                        margin: const EdgeInsets.only(bottom: 3),
                        width: 8,
                        height: index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexDots
                              ? AppColorTheme.mainColor
                              : AppColorTheme.mainColor.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
