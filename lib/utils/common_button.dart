import 'package:flutter/material.dart';
import '../common/color_constant.dart';

class CommonButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double? height;
  final Color? color;
  const CommonButtonWidget(
      {super.key,
      required this.onTap,
      required this.title,
      this.height = 60,
      this.color = ColorConstants.primaryColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: ColorConstants.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
