import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/view_models/product_view_model.dart';
import '../../requests/products/product_repository.dart';
import '../../utils/exceptions.dart';
import 'product_states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit({required this.productRepository, required this.viewModel,})
      : super(const InitialState());
  final ProductRepository productRepository;
  final ProductViewModel viewModel;
   
  

  Future<void> getProduct() async {
    try {
      emit(ProductLoading());

      final products = await productRepository.getAllProducts(
       
      );

      await viewModel.productList(products);

      
      emit(const ProductLoaded());
    } on ApiException catch (e) {
      emit(ProductApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(ProductNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> getProductsDetails({required String productId}) async {
    try {
      emit(ProductLoading());

      final products = await productRepository.getProductsDetails(
       productId: productId
      );

      await viewModel.productDetails(products);

      
      emit(const ProductLoaded());
    } on ApiException catch (e) {
      emit(ProductApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(ProductNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }
}
 