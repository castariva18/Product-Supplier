part of 'models.dart';

class ProductModel {
  ProductModel({
    required this.data,
    required this.message,
    required this.status,
  });

  Data data;
  String message;
  String status;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );
}

class DataProduct {
  DataProduct({
    required this.id,
    required this.namaBarang,
    required this.harga,
    required this.stok,
    required this.supplier,
  });

  int id;
  String namaBarang;
  int harga;
  int stok;
  Supplier supplier;

  factory DataProduct.fromJson(Map<String, dynamic> json) => DataProduct(
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
