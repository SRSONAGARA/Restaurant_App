import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rastaurant_app/features/home_screen/presentation/screen/home_screen.dart';
import 'package:rastaurant_app/features/register/presentation/cubits/register_state.dart';
import '../../../../common/color_constant.dart';
import '../../../../utils/common_button.dart';
import '../cubits/register_cubit.dart';
import '../widgets/sign_in_check_box.dart';
import '../widgets/sign_in_field_wigdet.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = '/Registration-Screen';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool checkedValue = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<RegistrationCubit>().togglePswVisibility();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: ColorConstants.primaryColor,
                              ))),
                      const Expanded(
                        flex: 7,
                        child: Center(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: 20, color: ColorConstants.greyColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  SignInFieldWidget(
                    controller: usernameController,
                    label: 'Username',
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SignInFieldWidget(
                    controller: fullNameController,
                    label: 'Full Name',
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SignInFieldWidget(
                    controller: emailController,
                    label: 'Email',
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  IntlPhoneField(
                    showDropdownIcon: false,
                    showCountryFlag: false,
                    keyboardType: TextInputType.number,
                    initialCountryCode: 'IN',
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (phone) {
                      countryController.text = phone.countryCode.substring(1);
                      phoneController.text = phone.number;
                    },
                    onCountryChanged: (country) {},
                  ),
                  TextFormField(
                    obscureText: context
                        .select((RegistrationCubit cubit) => cubit.isObscure),
                    controller: passwordController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorConstants.whiteColor,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      suffixIcon: IconButton(
                          onPressed: () {
                            context
                                .read<RegistrationCubit>()
                                .togglePswVisibility();
                          },
                          icon: Icon(context.select(
                                  (RegistrationCubit cubit) => cubit.isObscure)
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Expanded(
                      child: Checkbox(
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue!;
                            });
                          }),
                    ),
                    const SignInCheckBoxTextWidget()
                  ]),
                  const SizedBox(
                    height: 40,
                  ),
                  checkedValue
                      ? BlocConsumer<RegistrationCubit, RegistrationState>(
                          builder: (context, state) {
                          if (state is RegistrationLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return CommonButtonWidget(
                            onTap: () async {
                              handleSignInTap();
                            },
                            title: 'Sign up',
                          );
                        }, listener: (context, state) {
                          if (state is RegistrationErrorState) {
                            Fluttertoast.showToast(msg: state.msg);
                          }
                          if (state is RegistrationFailedState) {
                            Fluttertoast.showToast(msg: state.msg);
                          }
                          if (state is RegistrationSuccessState) {
                            Fluttertoast.showToast(msg: state.msg);
                            Navigator.pushNamed(context, HomeScreen.routeName);
                          }
                        })
                      : GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 60,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: ColorConstants.primaryColor
                                    .withOpacity(0.5)),
                            child: const Center(
                              child: Text(
                                'Sign up',
                                style:
                                    TextStyle(color: ColorConstants.whiteColor),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleSignInTap() {
    String email = emailController.text;
    String password = passwordController.text;
    String username = usernameController.text;
    String mobileNo = phoneController.text;
    String fullName = fullNameController.text;

    String? emailError = validateEmail(email);
    String? mobileNoError = validateMobileNo(mobileNo);
    String? passwordError = validatePassword(password);
    String? userNameError = validateUserName(username);
    String? fullNameError = validateFullName(fullName);
    if (userNameError != null) {
      Fluttertoast.showToast(msg: userNameError);
    } else if (fullNameError != null) {
      Fluttertoast.showToast(msg: fullNameError);
    } else if (emailError != null) {
      Fluttertoast.showToast(msg: emailError);
    } else if (mobileNoError != null) {
      Fluttertoast.showToast(msg: mobileNoError);
    } else if (passwordError != null) {
      Fluttertoast.showToast(msg: passwordError);
    } else {
      print("Email: $email, Password: $password");
      formKey.currentState!.save();
      context.read<RegistrationCubit>().registerApiCall(
          name: fullNameController.text,
          email: emailController.text,
          phoneNumber: phoneController.text,
          password: passwordController.text,
          country: countryController.text,
          userName: usernameController.text);
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

  String? validateUserName(String userName) {
    if (userName.isEmpty) {
      return "Please enter Username";
    }
    return null;
  }

  String? validateFullName(String userName) {
    if (userName.isEmpty) {
      return "Please enter Full Name";
    }
    return null;
  }

  String? validateMobileNo(String mobileNo) {
    if (mobileNo.isEmpty) {
      return "Please enter number";
    } else if (mobileNo.isEmpty) {
      return "Please enter country code";
    }
    return null;
  }
}
