import 'package:flutter/material.dart';
import 'package:gurte_jaba/theme/theme.dart';
import 'package:gurte_jaba/utils/utils.dart';

class CustomExplore extends StatelessWidget {
  const CustomExplore({super.key});

  @override
  Widget build(BuildContext context) {
    final images = {
      AssetPaths.ballon: 'Ballooning',
      AssetPaths.hiking: 'hiking',
      AssetPaths.kayaking: 'kayaking',
      AssetPaths.snorkeling: 'snorkeling'
    };
    return SizedBox(
      height: 120,
      width: double.maxFinite,
      child: ListView.builder(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.2),
                    image: DecorationImage(
                      image: AssetImage(
                        images.keys.elementAt(index),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  images.values.elementAt(index),
                  style: AppTextTheme.common.bodySmall!.copyWith(
                    color: AppColorTheme.textColor2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
