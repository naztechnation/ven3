
import 'package:ven/mobile_ui/products_details.dart';
import 'package:ven/models/products.dart';

import '../../res/enum.dart';
import '../products_details.dart';
import 'base_viewmodel.dart';


class ProductViewModel extends BaseViewModel {
 

 
  List<Products> _products = [];
  ProductDetails?  _productDetails;

  Future<void> productList(List<Products> products) async {
    _products = products;

    setViewState(ViewState.success);
  }

   Future<void> productDetails(ProductDetails products) async {
    _productDetails = products;

    setViewState(ViewState.success);
  }

  

  
  List<Products> get product => _products;
  ProductDetails? get productDetail => _productDetails;
}
