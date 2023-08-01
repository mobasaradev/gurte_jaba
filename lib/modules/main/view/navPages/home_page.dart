import 'package:flutter/material.dart';
import 'package:gurte_jaba/theme/app_color_theme.dart';
import 'package:gurte_jaba/theme/app_text_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Menu
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
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
                    color: Colors.grey.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          // Discover text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Discover',
              style: AppTextTheme.common.headlineLarge,
            ),
          ),
          const SizedBox(height: 30),
          // Tab Bar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: tabController,
                labelColor: Colors.black54,
                unselectedLabelColor: Colors.grey.withOpacity(0.5),
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 20),
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
              children: const [
                Text('Hey'),
                Text('There'),
                Text('bye'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Circle indicator
class CircleTabIndicator extends Decoration {
  const CircleTabIndicator({
    required this.color,
    required this.radius,
  });
  final Color color;
  final double radius;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

// Circle pointer
class _CirclePainter extends BoxPainter {
  _CirclePainter({
    required this.color,
    required this.radius,
  });

  final Color color;
  final double radius;

  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    );
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
