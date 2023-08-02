import 'package:flutter/material.dart';
import 'package:gurte_jaba/theme/app_color_theme.dart';
import 'package:gurte_jaba/theme/app_text_theme.dart';
import 'package:gurte_jaba/utils/asset_paths.dart';

import 'indicator_printer.dart';

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
    final images = [
      AssetPaths.mountain,
      AssetPaths.mountain1,
      AssetPaths.mountain2,
    ];
    return Column(
      children: [
        Align(
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
        SizedBox(
          width: double.maxFinite,
          height: 300,
          child: TabBarView(
            controller: tabController,
            children: [
              for (var i = 1; i <= images.length; i++)
                ListView.builder(
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(bottom: 10, left: 10),
                    margin: const EdgeInsets.only(
                      right: 15,
                      top: 10,
                    ),
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage(images.elementAt(index)),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              "Place Name",
                              style: AppTextTheme.common.bodySmall?.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "City, Country",
                            style: AppTextTheme.common.bodySmall?.copyWith(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
