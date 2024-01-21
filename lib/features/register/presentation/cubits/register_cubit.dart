import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rastaurant_app/features/register/presentation/cubits/register_state.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/api_constant.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitialState());
  void togglePswVisibility() {
    isObscure = !isObscure;
    emit(PswVisibilityChangeState(isObscure: isObscure));
  }

  bool isObscure = false;
  Future<void> registerApiCall({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
    required String country,
    required String userName,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      emit(RegistrationLoadingState());
      String url = ApiConstant.registrationApi;
      var requestBody = {
        "Name": name,
        "Email": email,
        "phone_number": phoneNumber,
        "Password": password,
        "Country": country,
        "UserName": userName
      };

      var response = await http.post(Uri.parse(url), body: requestBody);
      print(response.statusCode);
      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(responseBody['token']);
        print('clientId: ${responseBody['User']['client_id']}');
        pref.setString('token', responseBody['token']);
        pref.setInt('clientId', responseBody['User']['client_id']);

        emit(RegistrationSuccessState());
      } else if (response.statusCode == 400) {
        emit(RegistrationErrorState(msg: responseBody['message']));
      } else if (response.statusCode == 500) {
        emit(RegistrationFailedState());
      }
    } catch (e) {
      emit(RegistrationErrorState(msg: 'message'));
      print(e);
    }
  }
}
