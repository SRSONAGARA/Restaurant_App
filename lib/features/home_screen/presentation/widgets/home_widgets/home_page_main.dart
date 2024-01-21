import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/color_constant.dart';
import '../../cubits/home_screen_cubit.dart';
import '../../cubits/home_screen_state.dart';
import 'home_page_res_data.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(children: [
        SizedBox(
          height: 50,
          child: TabBar(
            tabs: [
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dine in',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pickup',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            dividerColor: Colors.transparent,
            labelPadding: EdgeInsets.zero,
            labelStyle:
                const TextStyle(fontSize: 16, color: ColorConstants.whiteColor),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.transparent),
              color: ColorConstants.primaryColor,
            ),
            unselectedLabelStyle:
                const TextStyle(color: ColorConstants.greyColor),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: TabBarView(
            children: [
              BlocBuilder<HomeScreenCubit, HomeScreenState>(
                builder: (context, state) {
                  final restaurantData =
                      BlocProvider.of<HomeScreenCubit>(context)
                          .restaurantModelClass;

                  if (state is HomeScreenLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                          color: ColorConstants.primaryColor),
                    );
                  }
                  if (state is HomeScreenInitialState) {
                    return const Center(
                      child: CircularProgressIndicator(
                          color: ColorConstants.primaryColor),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: restaurantData.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final restaurant = restaurantData.data?[index];

                      if (restaurant == null) {
                        return Container();
                      }

                      return HomePageResData(
                        restaurant: restaurant,
                      );
                    },
                  );
                },
              ),
              const Center(
                  child: Text(
                'No data found.',
                style: TextStyle(color: ColorConstants.greyColor, fontSize: 20),
              )),
            ],
          ),
        ),
      ]),
    );
  }
}
