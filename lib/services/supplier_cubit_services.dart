part of 'services.dart';

class SupplierServices {
  static Future<int> addSupplier(
    String alamat,
    String namaSupplier,
    String notelp,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    Map<String, dynamic> insertData = {
      'alamat': alamat,
      'id': 1,
      'namaSupplier': namaSupplier,
      'noTelp': notelp.toString(),
    };
    // print(insertData);
    try {
      final reponse = await Dio().post(
        '$baseUrl/supplier/create',
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

  static Future<List<SupplierModel>> getAllSupplier() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    try {
      final reponse = await Dio().get(
        '$baseUrl/supplier/find-all?limit=20&offset=1',
        options: Options(
          headers: {
            "content-Type": 'application/json',
            "authorization": "Bearer $token",
          },
        ),
      );
      final json = reponse.data;

      if (reponse.statusCode == 200) {
        List<SupplierModel> result = (json['data'] as Iterable)
            .map((e) => SupplierModel.fromJson(e))
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

  static Future<SupplierDetailModel> getDetailSupplier(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    try {
      final reponse = await Dio().get(
        '$baseUrl/supplier/find-by-id/' + '$id',
        options: Options(
          headers: {
            "content-Type": 'application/json',
            "authorization": "Bearer $token",
          },
        ),
      );

      final json = reponse.data;

      if (reponse.statusCode == 200) {
        SupplierDetailModel result = SupplierDetailModel.fromJson(json['data']);
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

  static Future<int> updateSupplier(
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
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    try {
      final reponse = await Dio().put(
        '$baseUrl/supplier/update/$id',
        data: updateData,
        options: Options(
          headers: {
            "content-Type": 'application/json',
            "authorization": "Bearer $token",
          },
        ),
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

  static Future<String> deleteSupplier(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    try {
      final reponse = await Dio().delete(
        '$baseUrl/supplier/delete/$id',
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
