part of 'models.dart';

class LoginModel {
  LoginModel({
    required this.data,
    required this.message,
    required this.status,
  });

  String status;
  String message;
  Data data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    required this.id,
    required this.username,
    required this.profileName,
    required this.token,
  });

  int id;
  String username;
  String profileName;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["username"],
        profileName: json["profileName"],
        token: json["token"],
      );
}
