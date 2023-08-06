import 'package:flutter/material.dart';
import 'package:gurte_jaba/modules/modules.dart';
import 'package:gurte_jaba/theme/theme.dart';
import 'package:gurte_jaba/utils/asset_paths.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menu
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black54,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage(AssetPaths.snorkeling),
                      ),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Discover text
            Text(
              'Discover',
              style: AppTextTheme.common.headlineLarge,
            ),
            const SizedBox(height: 30),
            // Tab Bar
            const CustomTabBar(),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore more",
                  style: AppTextTheme.common.headlineLarge!.copyWith(
                    fontSize: 22,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "See All",
                    style: AppTextTheme.common.bodySmall!.copyWith(
                      color: AppColorTheme.textColor1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const CustomExplore(),
          ],
        ),
      ),
    );
  }
}
