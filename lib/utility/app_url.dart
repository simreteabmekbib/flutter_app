class AppUrl {

  static const String baseUrl = 'http://127.0.0.1:5000/';

  static const String login = baseUrl + '/api/v1/user/login';
  static const String register = baseUrl + '/api/v1/user/register';
  static const String forgotPassword = baseUrl + '/api/v1/user/plant/<user_id>';
}