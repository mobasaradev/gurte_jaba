import 'package:flutter/material.dart';
import 'package:gurte_jaba/theme/app_color_theme.dart';
import 'package:gurte_jaba/utils/asset_paths.dart';

import 'indecator_printer.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Column(
      children: [
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: tabController,
              labelColor: Colors.black54,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              isScrollable: true,
              labelPadding: const EdgeInsets.only(right: 20),
              indicatorSize: TabBarIndicatorSize.label,
              indicator: const CircleTabIndicator(
                color: AppColorTheme.mainColor,
                radius: 4,
              ),
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: 'Places'),
                Tab(text: 'Inspiration'),
                Tab(text: 'Emotions'),
              ],
            ),
          ),
        ),
        SizedBox(
          width: double.maxFinite,
          height: 300,
          child: TabBarView(
            controller: tabController,
            children: [
              ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(
                    right: 15,
                    top: 10,
                  ),
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: const DecorationImage(
                      image: AssetImage(
                        AssetPaths.mountain,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Text('There'),
              const Text('bye'),
            ],
          ),
        ),
      ],
    );
  }
}
