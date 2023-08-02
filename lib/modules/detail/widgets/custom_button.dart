import 'package:flutter/material.dart';
import 'package:gurte_jaba/theme/theme.dart';


class CustomContainerButton extends StatelessWidget {
  const CustomContainerButton({
    super.key,
    required this.color,
    required this.borderColor,
    required this.bgColor,
    required this.size,
    this.text = '',
    this.icon,
    this.isIcon = false,
  });
  final Color color;
  final Color borderColor;
  final Color bgColor;
  final double size;
  final String? text;
  final IconData? icon;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: bgColor,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: isIcon == false
          ? Center(
              child: Text(
                text!,
                style: AppTextTheme.common.bodySmall!.copyWith(
                  color: color,
                ),
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
