import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rastaurant_app/features/login/presentation/cubits/login_cubit.dart';
import 'package:rastaurant_app/features/login/presentation/cubits/login_state.dart';
import 'package:rastaurant_app/features/register/presentation/screen/register_screen.dart';
import '../../../../common/color_constant.dart';
import '../../../home_screen/presentation/screen/home_screen.dart';
import '../widgets/login_screen_button.dart';
import '../widgets/login_with_social.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/Login-Screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorConstants.secondaryColor,
              ColorConstants.primaryColor
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Text(
                          'Skip',
                          style: TextStyle(color: ColorConstants.whiteColor),
                        ),
                        Icon(
                          CupertinoIcons.right_chevron,
                          color: ColorConstants.whiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                        height: 230,
                        child: Center(
                            child: Image.asset('assets/app_logo.png',
                                height: 150))),
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ColorConstants.secondaryColor,
                            ColorConstants.primaryColor
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 20,
                          top: 25,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Login your account',
                                style: TextStyle(
                                  color: ColorConstants.whiteColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            LoginScreenButtonWidget(
                              controller: emailController,
                              iconData: Icons.person_outline,
                              hintText: 'E-mail',
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            LoginScreenButtonWidget(
                              controller: passwordController,
                              iconData: Icons.lock_outline,
                              hintText: 'Password',
                              textInputAction: TextInputAction.done,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: RichText(
                                  text: const TextSpan(
                                    text: 'Forgot your password?',
                                    style: TextStyle(
                                      color: ColorConstants.whiteColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            BlocConsumer<LoginCubit, LoginState>(
                                builder: (context, state) {
                              if (state is LoginLoadingState) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorConstants.whiteColor,
                                  ),
                                );
                              }
                              return GestureDetector(
                                onTap: () {
                                  handleLoginTap();
                                },
                                child: Container(
                                  height: 60,
                                  width: double.maxFinite,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        ColorConstants.darkPrimaryColor,
                                        ColorConstants.primaryColor
                                      ],
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: ColorConstants.primaryColor,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: ColorConstants.whiteColor,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }, listener: (context, state) {
                              if (state is LoginErrorState) {
                                Fluttertoast.showToast(msg: state.msg);
                              }
                              if (state is LoginFailedState) {
                                Fluttertoast.showToast(msg: state.msg);
                              }
                              if (state is LoginSuccessState) {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    HomeScreen.routeName, (route) => false);
                                Fluttertoast.showToast(msg: state.msg);
                              }
                            })
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "You don't have an account yet !",
                          style: TextStyle(color: ColorConstants.whiteColor),
                        ),
                        const SizedBox(width: 15),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RegistrationScreen.routeName,
                            );
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: 'Sign in',
                              style: TextStyle(
                                color: ColorConstants.whiteColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const LoginWithDivider(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LoginWithSocial(
                          imagePath: 'assets/google.png',
                        ),
                        LoginWithSocial(
                          imagePath: 'assets/apple.png',
                        ),
                        LoginWithSocial(
                          imagePath: 'assets/facebook.png',
                        ),
                        LoginWithSocial(
                          imagePath: 'assets/twitter.png',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleLoginTap() {
    String email = emailController.text;
    String password = passwordController.text;

    String? emailError = validateEmail(email);
    String? passwordError = validatePassword(password);
    if (emailError != null) {
      Fluttertoast.showToast(msg: emailError);
    } else if (passwordError != null) {
      Fluttertoast.showToast(msg: passwordError);
    } else {
      print("Email: $email, Password: $password");
      context
          .read<LoginCubit>()
          .loginApiCall(phoneNumber: email, password: password);
    }
  }

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return "Email can't be empty";
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(email)) {
      return "Enter a correct email";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Password can't be empty";
    } else if (password.length < 6) {
      return "Password is not less than 6 letters";
    }
    return null;
  }
}

class LoginWithDivider extends StatelessWidget {
  const LoginWithDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const Divider(
              color: ColorConstants.whiteColor,
              height: 36,
            ),
          ),
        ),
        const Text(
          'Login with',
          style: TextStyle(color: ColorConstants.whiteColor),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const Divider(
              color: ColorConstants.whiteColor,
              height: 36,
            ),
          ),
        ),
      ],
    );
  }
}
