import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/api_constant.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> loginApiCall(
      {required String phoneNumber, required String password}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      emit(LoginLoadingState());
      String url = ApiConstant.loginApi;
      var requestBody = {"phone_number": phoneNumber, "password": password};

      var response = await http.post(Uri.parse(url), body: requestBody);
      print(response.statusCode);
      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('loginModelClass:${responseBody['token']}');
        print('loginModelClass:${responseBody['user']['client_id']}');
        pref.setString('token', responseBody['token']);
        pref.setInt('clientId', responseBody['user']['client_id']);

        emit(LoginSuccessState(msg: responseBody['message']));
      } else if (response.statusCode == 400) {
        emit(LoginErrorState(msg: responseBody['message']));
      }
    } catch (e) {
      emit(LoginFailedState(msg: 'message'));
      print(e);
    }
  }
}
