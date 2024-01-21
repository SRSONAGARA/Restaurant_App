import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rastaurant_app/features/home_screen/presentation/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/routes/app_routes.dart';
import 'features/home_screen/presentation/cubits/home_screen_cubit.dart';
import 'features/login/presentation/cubits/login_cubit.dart';
import 'features/login/presentation/screen/login_screen.dart';
import 'features/register/presentation/cubits/register_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn = await checkToken();
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

Future<bool> checkToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? token = pref.getString('token');
  return token != null && token.isNotEmpty;
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(create: (_) => LoginCubit()),
          BlocProvider<RegistrationCubit>(create: (_) => RegistrationCubit()),
          BlocProvider<HomeScreenCubit>(create: (_) => HomeScreenCubit()),
        ],
        child: MaterialApp(
          title: 'Restaurant App',
          debugShowCheckedModeBanner: false,
          initialRoute:
              isLoggedIn ? HomeScreen.routeName : LoginScreen.routeName,
          routes: AppRoutes.getAppRoutes,
        ));
  }
}
