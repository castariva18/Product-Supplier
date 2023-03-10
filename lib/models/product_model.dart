part of 'models.dart';

class ProductModel {
  ProductModel({
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
  Supplier supplier;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        namaBarang: json["namaBarang"],
        harga: json["harga"],
        stok: json["stok"],
        supplier: Supplier.fromJson(json["supplier"]),
      );
}

class Supplier {
  Supplier({
    required this.id,
    required this.namaSupplier,
    required this.noTelp,
    required this.alamat,
  });

  int id;
  String namaSupplier;
  String noTelp;
  String alamat;

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        id: json["id"],
        namaSupplier: json["namaSupplier"],
        noTelp: json["noTelp"],
        alamat: json["alamat"],
      );
}
