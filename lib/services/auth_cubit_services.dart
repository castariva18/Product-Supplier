part of 'services.dart';

class AuthServices {
  static Future<LoginModel> authLogin(String username, String password) async {
    Map<String, dynamic> loginData = {
      'Username': username,
      'Password': password,
    };
    final reponse = await Dio().post('$baseUrl/auth/login',
        data: loginData,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));

    final json = reponse.data;
    if (reponse.statusCode == 200) {
      LoginModel loginResult = LoginModel.fromJson(json);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('token', loginResult.token);
      return loginResult;
    } else if (reponse.statusCode == 401) {
      return throw Exception("Wrong Password!");
    } else if (reponse.statusCode == 404) {
      return throw Exception("Password not valid!");
    } else {
      return throw Exception("Error Server");
    }
  }

  /// Logout Method
  static Future<void> signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('token');
  }
}
