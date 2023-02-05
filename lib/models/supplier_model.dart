part of 'models.dart';

class SupplierModel {
  SupplierModel({
    required this.data,
    required this.message,
    required this.status,
  });

  DataSupplier data;
  String message;
  String status;

  factory SupplierModel.fromJson(Map<String, dynamic> json) => SupplierModel(
        data: DataSupplier.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );
}

class DataSupplier {
  DataSupplier({
    required this.id,
    required this.namaSupplier,
    required this.noTelp,
    required this.alamat,
  });

  int id;
  String namaSupplier;
  String noTelp;
  String alamat;

  factory DataSupplier.fromJson(Map<String, dynamic> json) => DataSupplier(
        id: json["id"],
        namaSupplier: json["namaSupplier"],
        noTelp: json["noTelp"],
        alamat: json["alamat"],
      );
}
