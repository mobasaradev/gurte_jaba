import 'package:flutter/material.dart';
import 'package:gurte_jaba/theme/app_color_theme.dart';
import 'package:gurte_jaba/utils/asset_paths.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.isResponsive = false,
    this.widget,
  });
  final bool? isResponsive;
  final double? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColorTheme.mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetPaths.btnIcon,
            width: 30,
          )
        ],
      ),
    );
  }
}
