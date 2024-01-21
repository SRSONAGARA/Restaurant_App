import 'package:flutter/material.dart';
import '../../../../common/color_constant.dart';

class SignInCheckBoxTextWidget extends StatefulWidget {
   const SignInCheckBoxTextWidget({super.key});

  @override
  State<SignInCheckBoxTextWidget> createState() => _SignInCheckBoxTextWidgetState();
}

class _SignInCheckBoxTextWidgetState extends State<SignInCheckBoxTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: RichText(
        softWrap: true,
        text: const TextSpan(
          text: "I agree with the company's ",
          style: TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: 'privacy policy',
              style: TextStyle(
                color: ColorConstants.primaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: ' and ',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'terms of service',
              style: TextStyle(
                color: ColorConstants.primaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
