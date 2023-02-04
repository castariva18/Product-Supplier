part of 'models.dart';

class RegisterModel {
  RegisterModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  Data data;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class DataRegister {
  DataRegister({
    required this.id,
    required this.profileName,
    required this.username,
    required this.password,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String profileName;
  String username;
  String password;
  bool status;
  DateTime createdAt;
  DateTime updatedAt;

  factory DataRegister.fromJson(Map<String, dynamic> json) => DataRegister(
        id: json["id"],
        profileName: json["profileName"],
        username: json["Username"],
        password: json["password"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );
}
