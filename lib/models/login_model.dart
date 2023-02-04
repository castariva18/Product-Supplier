part of 'models.dart';

class LoginModel {
  LoginModel({
    required this.status,
    required this.message,
    required this.data,
    required this.token,
  });

  int status;
  String message;
  Data data;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        token: json["token"],
      );
}

class Data {
  Data({
    required this.id,
    required this.username,
    required this.password,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String username;
  String password;
  bool status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        username: json["Username"],
        password: json["password"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
