import 'package:ven/models/products.dart';

import '../../models/products_details.dart';



abstract class ProductRepository {
  Future<List<Products>> getAllProducts();

  Future<ProductDetails> getProductsDetails({
    required String productId,
   
  });
}