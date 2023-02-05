part of 'models.dart';

class SupplierDetailModel {
  SupplierDetailModel({
    required this.id,
    required this.namaSupplier,
    required this.noTelp,
    required this.alamat,
  });

  int id;
  String namaSupplier;
  String noTelp;
  String alamat;

  factory SupplierDetailModel.fromJson(Map<String, dynamic> json) =>
      SupplierDetailModel(
        id: json["id"],
        namaSupplier: json["namaSupplier"],
        noTelp: json["noTelp"],
        alamat: json["alamat"],
      );
}
