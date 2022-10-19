import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/produk_model.dart';

class ApiServiceKat {
  ApiServiceKat({
    required this.nama_kategori,
  });

  String nama_kategori;

  Future<Produk> topHeadlines() async {
    final response = await http.get(
        Uri.parse('https://api.yufagency.com/product_filter_category/$nama_kategori'));
    if (response.statusCode == 200) {
      return Produk.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}