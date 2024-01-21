import 'package:flutter/material.dart';
import '../../../../../common/color_constant.dart';

class ProfileTabController extends StatefulWidget {
  const ProfileTabController({super.key});

  @override
  State<ProfileTabController> createState() => _ProfileTabControllerState();
}

class _ProfileTabControllerState extends State<ProfileTabController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(children: [
        SizedBox(
          height: 40,
          child: TabBar(
            tabs: const [
              Tab(
                child: ProfileTabText(
                  t1: 'Rated',
                  t2: '0',
                ),
              ),
              ProfileTabText(
                t1: 'Visited',
                t2: '0',
              ),
              ProfileTabText(
                t1: 'Favorite',
                t2: '0',
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
          height: MediaQuery.of(context).size.height / 0.1,
          child: const TabBarView(
            children: [
              ProfileTabData(),
              ProfileTabData(),
              ProfileTabData(),
            ],
          ),
        ),
      ]),
    );
  }
}

class ProfileTabData extends StatelessWidget {
  const ProfileTabData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 50),
      child: Text(
        'No data found.',
        textAlign: TextAlign.center,
        style: TextStyle(color: ColorConstants.greyColor),
      ),
    );
  }
}

class ProfileTabText extends StatelessWidget {
  final String t1;
  final String t2;
  const ProfileTabText({
    super.key,
    required this.t1,
    required this.t2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              t1,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            Text(
              t2,
            ),
          ],
        ),
      ),
    );
  }
}
