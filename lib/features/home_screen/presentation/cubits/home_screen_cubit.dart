import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rastaurant_app/features/home_screen/data/profile_model_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/api_constant.dart';
import '../../data/restaurant_data.dart';
import 'home_screen_state.dart';
import 'package:http/http.dart' as http;

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  UserDataModel userDataModel = UserDataModel();
  RestaurantModelClass restaurantModelClass = RestaurantModelClass();

  Future<void> restaurantApiCall() async {
    try {
      emit(HomeScreenLoadingState());
      String url = ApiConstant.restaurantApi;
      var response = await http.get(Uri.parse(url));
      print(response.statusCode);
      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        restaurantModelClass = RestaurantModelClass.fromJson(responseBody);
        emit(HomeScreenSuccessState());
      } else if (response.statusCode == 400) {
        restaurantModelClass = RestaurantModelClass.fromJson(responseBody);
        emit(HomeScreenErrorState());
      }
    } catch (e) {
      emit(HomeScreenErrorState());
      print(e);
    }
  }

  Future<void> profileScreenApi() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      emit(HomeScreenInitialState());
      String? token = pref.getString('token');
      String? clientId = pref.getInt('clientId').toString();
      String url =
          '${ApiConstant.getProfile}?ClientID=$clientId&userid=$clientId';
      var response = await http
          .get(Uri.parse(url), headers: {'Authorization': "Bearer $token"});
      print(response.statusCode);
      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        userDataModel = UserDataModel.fromJson(responseBody);
        emit(HomeScreenSuccessState());
      } else if (response.statusCode == 400) {
        userDataModel = UserDataModel.fromJson(responseBody);
        emit(HomeScreenErrorState());
      }
    } catch (e) {
      print(e);
    }
  }
}
