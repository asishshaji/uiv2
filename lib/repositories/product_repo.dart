import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiv2/models/product.dart';

final productProvider =
    Provider<ProductRepository>((ref) => ProductRepository());

class ProductRepository {
  ProductRepository();
  final Dio dio = Dio();

  Future<Product> getProductById({required int id}) {
    throw UnimplementedError();
  }

  Future<List<Product>> getProducts() async {
    List<Product> products = [];
    try {
      var dioV = Dio();
      Response<List<dynamic>> response =
          await dioV.get("http://0.0.0.0:9090/product");

      for (dynamic item in response.data!) {
        products.add(Product.fromJson(item));
      }

      return products;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteProduct(int id) async {
    print(id);

    try {
      await dio.delete(
        "http://0.0.0.0:9090/product/" + id.toString(),
      );
    } catch (e) {
      print(e);
    }
  }
}
