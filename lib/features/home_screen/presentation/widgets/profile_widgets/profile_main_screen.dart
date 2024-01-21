import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rastaurant_app/features/home_screen/presentation/widgets/profile_widgets/profile_follow_button_widget.dart';
import 'package:rastaurant_app/features/home_screen/presentation/widgets/profile_widgets/profile_tab_controller.dart';
import '../../../../../common/color_constant.dart';
import '../../cubits/home_screen_cubit.dart';
import '../../cubits/home_screen_state.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
      final homeCubit = BlocProvider.of<HomeScreenCubit>(context);
      return Column(
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: homeCubit.userDataModel.data![0].avatar ??
                const AssetImage('assets/person_image.png'),
          ),
          Text(
            homeCubit.userDataModel.data![0].clientName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            '@${homeCubit.userDataModel.data![0].username}',
            style:
                const TextStyle(fontSize: 15, color: ColorConstants.greyColor),
          ),
          Text(homeCubit.userDataModel.data![0].bio ?? "Your bio data.",
              style: const TextStyle(
                  fontSize: 15, color: ColorConstants.greyColor400),
              textAlign: TextAlign.center),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text('Followers',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.greyColor)),
                  Text(
                      homeCubit.userDataModel.data![0].followlist.follower
                          .toString(),
                      style: const TextStyle(color: ColorConstants.greyColor)),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  const Text('Following',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.greyColor)),
                  Text(
                      homeCubit.userDataModel.data![0].followlist.following
                          .toString(),
                      style: const TextStyle(color: ColorConstants.greyColor)),
                ],
              ),
            ],
          ),
          const ProfileFollowButtonWidget(),
          const Divider(),
          const ProfileTabController(),
        ],
      );
    });
  }
}
