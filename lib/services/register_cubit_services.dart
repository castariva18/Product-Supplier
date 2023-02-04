part of 'services.dart';

class RegisterServices {
  static Future<RegisterModel> authRegister(
      String profileName, String username, String password) async {
    Map<String, dynamic> loginData = {
      'profileName': profileName,
      'Username': username,
      'Password': password,
    };
    final reponse = await Dio().post('$baseUrl/auth/registerasi',
        data: loginData,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));

    final json = reponse.data;
    if (reponse.statusCode == 200) {
      RegisterModel loginResult = RegisterModel.fromJson(json);
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
