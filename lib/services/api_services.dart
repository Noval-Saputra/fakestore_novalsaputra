import 'dart:convert';
import 'package:fakestore_novalsaputra/model/produk_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = 'https://fakestoreapi.com/products';
}

Future<List<Products>> getAllProducts() async {
  final response = await http.get(Uri.parse(ApiServices.baseUrl));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((item) => Products.fromJson(item)).toList();
  } else {
    throw Exception('gagal mengambil data produk');
  }
}