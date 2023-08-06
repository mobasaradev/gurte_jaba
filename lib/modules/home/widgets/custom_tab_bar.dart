import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gurte_jaba/modules/cubit/app_cubit.dart';
import 'package:gurte_jaba/modules/modules.dart';
import 'package:gurte_jaba/theme/theme.dart';

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
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is LoadedState) {
          final info = state.places;
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
                    for (var i = 1; i <= tabController.length; i++)
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubit>(context).detailPage(info[index]);
                          },
                          child: Container(
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
                                image: NetworkImage(
                                    'http://mark.bslmeiyu.com/uploads/${info[index].img}'),
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
                                      style:
                                          AppTextTheme.common.bodySmall?.copyWith(
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
                                    style:
                                        AppTextTheme.common.bodySmall?.copyWith(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
