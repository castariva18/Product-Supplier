part of 'models.dart';

class ProductDetailModel {
  ProductDetailModel({
    required this.id,
    required this.namaBarang,
    required this.harga,
    required this.stok,
    required this.supplier,
  });

  int id;
  String namaBarang;
  double harga;
  int stok;
  SupplierDetail supplier;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        id: json["id"],
        namaBarang: json["namaBarang"],
        harga: json["harga"],
        stok: json["stok"],
        supplier: SupplierDetail.fromJson(json["supplier"]),
      );
}

class SupplierDetail {
  SupplierDetail({
    required this.id,
    required this.namaSupplier,
    required this.noTelp,
    required this.alamat,
  });

  int id;
  String namaSupplier;
  String noTelp;
  String alamat;

  factory SupplierDetail.fromJson(Map<String, dynamic> json) => SupplierDetail(
        id: json["id"],
        namaSupplier: json["namaSupplier"],
        noTelp: json["noTelp"],
        alamat: json["alamat"],
      );
}
