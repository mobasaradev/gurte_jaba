import 'package:flutter/material.dart';
import 'package:gurte_jaba/theme/app_color_theme.dart';
import 'package:gurte_jaba/theme/app_text_theme.dart';
import 'package:gurte_jaba/utils/asset_paths.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.isResponsive = false,
    this.widget = 120,
    this.onTap,
    this.pageName,
  });
  final bool? isResponsive;
  final double? widget;
  final dynamic pageName;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: isResponsive == true ? double.maxFinite : widget,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColorTheme.mainColor,
          ),
          child: Row(
            mainAxisAlignment: isResponsive == true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              isResponsive == true
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Book Trip Now",
                        style: AppTextTheme.common.bodySmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container(),
              isResponsive == true
                  ? Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Image.asset(AssetPaths.btnIcon, width: 30),
                    )
                  : Image.asset(AssetPaths.btnIcon, width: 30)
            ],
          ),
        ),
      ),
    );
  }
}
