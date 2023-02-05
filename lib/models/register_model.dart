part of 'models.dart';

class RegisterModel {
  RegisterModel({
    required this.data,
    required this.message,
    required this.status,
  });

  DataRegister data;
  String message;
  String status;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        data: DataRegister.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );
}

class DataRegister {
  DataRegister({
    required this.id,
    required this.username,
    required this.profileName,
  });

  int id;
  String username;
  String profileName;

  factory DataRegister.fromJson(Map<String, dynamic> json) => DataRegister(
        id: json["id"],
        username: json["username"],
        profileName: json["profileName"],
      );
}
