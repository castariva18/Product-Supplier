part of 'services.dart';

class RegisterServices {
  static Future<RegisterModel> authRegister(
      String password, String profileName, String username) async {
    Map<String, dynamic> registerData = {
      "password": password,
      "profileName": profileName,
      "username": username
    };
    final reponse = await Dio().post('$baseUrl/auth/register',
        data: registerData,
        options: Options(
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));

    final json = reponse.data;

    print(json);
    if (reponse.statusCode == 200) {
      RegisterModel registerResult = RegisterModel.fromJson(json);

      return registerResult;
    } else if (reponse.statusCode == 401) {
      return throw Exception("Wrong Password!");
    } else if (reponse.statusCode == 404) {
      return throw Exception("Password not valid!");
    } else {
      return throw Exception("Error Server");
    }
  }
}
