import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rastaurant_app/common/color_constant.dart';
import '../cubits/home_screen_cubit.dart';
import '../widgets/home_widgets/home_page_main.dart';
import '../widgets/profile_widgets/profile_main_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/Home-Screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    apicall();
  }

  apicall() async {
    final homeCubit = BlocProvider.of<HomeScreenCubit>(context);
    await homeCubit.profileScreenApi();
    await homeCubit.restaurantApiCall();
  }

  bool isProfileOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: ColorConstants.whiteColor,
        ),
        Container(
          height: 120,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                ColorConstants.primaryColor,
                ColorConstants.secondaryColor
              ],
            ),
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          top: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.greyColor100.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: isProfileOpen
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isProfileOpen = !isProfileOpen;
                                    });
                                  },
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                    ),
                                    child: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isProfileOpen = !isProfileOpen;
                                    });
                                  },
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorConstants.primaryColor,
                                    ),
                                    child: const Icon(
                                      Icons.align_horizontal_left,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                        ),
                        Expanded(
                            flex: 5,
                            child: Center(
                              child: isProfileOpen
                                  ? const Text(
                                      'Profile',
                                      style: TextStyle(
                                          color: ColorConstants.whiteColor,
                                          fontSize: 20),
                                    )
                                  : const Text(
                                      'Restaurants',
                                      style: TextStyle(
                                          color: ColorConstants.whiteColor,
                                          fontSize: 20),
                                    ),
                            )),
                        Expanded(
                          flex: 2,
                          child: isProfileOpen
                              ? GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          ColorConstants.secondaryColor,
                                          ColorConstants.primaryColor
                                        ],
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        )
                      ],
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              isProfileOpen ? const ProfileMainScreen() : const SizedBox(),
              const HomePageScreen(),
            ],
          ),
        ),
      ],
    ));
  }
}
