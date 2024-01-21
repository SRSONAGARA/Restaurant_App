import 'package:flutter/material.dart';
import '../../../../common/color_constant.dart';

class LoginWithSocial extends StatelessWidget {
  final String imagePath;
  const LoginWithSocial({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ));
  }
}
