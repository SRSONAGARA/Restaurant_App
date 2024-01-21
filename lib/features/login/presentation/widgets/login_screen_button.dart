import 'package:flutter/material.dart';
import '../../../../common/color_constant.dart';

class LoginScreenButtonWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String hintText;
  final TextInputAction textInputAction;
  const LoginScreenButtonWidget(
      {super.key,
      required this.controller,
      required this.iconData,
      required this.hintText,
      required this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorConstants.whiteColor,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(iconData, color: ColorConstants.greyColor400),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
