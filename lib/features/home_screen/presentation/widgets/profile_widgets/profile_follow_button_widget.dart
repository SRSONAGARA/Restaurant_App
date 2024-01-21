import 'package:flutter/material.dart';
import '../../../../../common/color_constant.dart';
import '../../../../../utils/common_button.dart';

class ProfileFollowButtonWidget extends StatelessWidget {
  const ProfileFollowButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: CommonButtonWidget(
                onTap: () {},
                title: 'Follow',
                height: 50,
              )),
          const SizedBox(width: 10),
          Expanded(
              flex: 2,
              child: CommonButtonWidget(
                onTap: () {},
                title: 'Message',
                height: 50,
                color: ColorConstants.secondaryColor,
              )),
        ],
      ),
    );
  }
}
