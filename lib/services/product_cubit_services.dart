part of 'services.dart';

class ProductServices {
  static Future<int> addProduct(
    int harga,
    int id,
    String namaBarang,
    int stok,
    String alamat,
    int idSupplier,
    String namaSupplier,
    String noTelp,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    Map<String, dynamic> insertData = {
      "harga": harga,
      "id": 1,
      "namaBarang": namaBarang,
      "stok": stok,
      "supplier": {
        "alamat": alamat,
        "id": idSupplier,
        "namaSupplier": namaSupplier,
        "noTelp": noTelp
      }
    };
    // print(insertData);
    try {
      final reponse = await Dio().post(
        '$baseUrl/barang/create',
        data: insertData,
        options: Options(
            headers: {
              "content-Type": 'application/json',
              "authorization": "Bearer $token",
            },
            contentType: Headers.formUrlEncodedContentType,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );

      // print(reponse);
      final json = reponse.data;
      if (reponse.statusCode == 200) {
        return json['status'];
      } else if (reponse.statusCode == 404) {
        return throw Exception("Gagal menambahkan supplier!");
      } else {
        return throw Exception(json['msg']);
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<ProductModel>> getAllProduct() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    try {
      final reponse = await Dio().get(
        '$baseUrl/barang/find-all?limit=20&offset=1',
        options: Options(
          headers: {
            "content-Type": 'application/json',
            "authorization": "Bearer $token",
          },
        ),
      );
      final json = reponse.data;

      if (reponse.statusCode == 200) {
        List<ProductModel> result = (json['data'] as Iterable)
            .map((e) => ProductModel.fromJson(e))
            .toList();

        return result;
      } else if (reponse.statusCode == 404) {
        return throw Exception(json['message']);
      } else {
        return throw Exception(json['msg']);
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<ProductDetailModel> getDetailProduct(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    try {
      final reponse = await Dio().get(
        '$baseUrl/barang/find-by-id/' + '$id',
        options: Options(
          headers: {
            "content-Type": 'application/json',
            "authorization": "Bearer $token",
          },
        ),
      );

      final json = reponse.data;

      if (reponse.statusCode == 200) {
        ProductDetailModel result = ProductDetailModel.fromJson(json['data']);
        return result;
      } else if (reponse.statusCode == 404) {
        return throw Exception(json['message']);
      } else {
        return throw Exception(json['msg']);
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<int> updateProduct(
    String alamat,
    int id,
    String namaSupplier,
    String noTelp,
  ) async {
    Map<String, dynamic> updateData = {
      'alamat': alamat,
      'id': id,
      'namaSupplier': namaSupplier,
      'noTelp': noTelp,
    };

    try {
      final reponse = await Dio().put(
        baseUrl + '/barang/update/' + '$id',
        data: updateData,
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
            followRedirects: false,
            receiveTimeout: 3000,
            sendTimeout: 5000,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      final json = reponse.data;
      if (reponse.statusCode == 200) {
        // CustomerModel result = CustomerModel.fromJson(json['data']);
        return json['status'];
      } else if (reponse.statusCode == 404) {
        return throw Exception("Gagal menambahkan data!");
      } else {
        return throw Exception("Ada kesalahan pada server");
      }
    } catch (e) {
      return throw Exception("Ada kesalahan pada server");
    }
  }

  static Future<String> deleteProduct(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    try {
      final reponse = await Dio().delete(
        '$baseUrl/barang/delete/$id',
        options: Options(
          headers: {
            "content-Type": 'application/json',
            "authorization": "Bearer $token",
          },
        ),
      );
      final json = reponse.data;
      // print(json.toString());
      if (reponse.statusCode == 200) {
        print(json.toString());
        return json['msg'];
      } else if (reponse.statusCode == 404) {
        return throw Exception("Hapus Gagal!");
      } else {
        print(json['msg']);
        return throw Exception(json['msg']);
      }
    } catch (e) {
      print(e.toString());
      return throw Exception("Ada kesalahan pada server");
    }
  }
}
