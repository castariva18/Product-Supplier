part of 'models.dart';

class SupplierModel {
  SupplierModel({
    required this.id,
    required this.namaSupplier,
    required this.noTelp,
    required this.alamat,
  });

  int id;
  String namaSupplier;
  String noTelp;
  String alamat;

  factory SupplierModel.fromJson(Map<String, dynamic> json) => SupplierModel(
        id: json["id"],
        namaSupplier: json["namaSupplier"],
        noTelp: json["noTelp"],
        alamat: json["alamat"],
      );
}
