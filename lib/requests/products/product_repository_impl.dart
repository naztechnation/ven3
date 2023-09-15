
import 'dart:convert';

import '../../../res/app_strings.dart';
import '../../models/products.dart';
import '../../models/products_details.dart';
import '../setup/requests.dart';
import 'product_repository.dart';
import 'package:http/http.dart' as http;


class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Products>> getAllProducts(
      ) async {

         final response = await http.get(Uri.parse(AppStrings.products,));

   if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    List<Products> products = data.map((json) => Products.fromJson(json)).toList();
    return products;
  } else {
    throw Exception('Failed to load products');
  }
    
  }

@override
  Future<ProductDetails> getProductsDetails(
  {
    required String productId,
   
  }
      ) async {
   
    final map = await Requests().get(AppStrings.productDetails(productId: productId),);

    return ProductDetails.fromJson(map);
  }
}