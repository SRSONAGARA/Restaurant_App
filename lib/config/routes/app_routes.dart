import 'package:flutter/cupertino.dart';
import 'package:rastaurant_app/features/home_screen/presentation/screen/home_screen.dart';
import '../../features/login/presentation/screen/login_screen.dart';
import '../../features/register/presentation/screen/register_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> get getAppRoutes => {
        RegistrationScreen.routeName: (_) => const RegistrationScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),

      };
}
