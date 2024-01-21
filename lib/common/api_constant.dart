class ApiConstant {
  static const baseUrl = 'https://user.requeue.com';
  static const registrationApi = '$baseUrl/user/auth/SignUp';
  static const loginApi = '$baseUrl/user/auth/login';
  static const getProfile = '$baseUrl/user/profiles/get-profiles';
  static const restaurantApi = '$baseUrl/user/mainpages/get-restaurants?PickupAvailable=1&AreaName=Kuwait&page=1&page limit=10';
  static const restaurantApiForLogo = 'https://cdn.requeue.net/media/logos/user/mainpages/get-restaurants?PickupAvailable=1&AreaName=Kuwait&page=1&page limit=10';
}
