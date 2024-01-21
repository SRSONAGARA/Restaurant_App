import 'package:flutter/material.dart';
import '../../../../common/color_constant.dart';

class SignInFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputAction textInputAction;
  const SignInFieldWidget(
      {super.key, required this.controller, required this.label, required this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorConstants.whiteColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        labelText: label,
      ),
    );
  }
}
