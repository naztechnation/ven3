
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ven/mobile_ui/products_details.dart';
import 'package:ven/res/app_colors.dart';

import '../blocs/account/product.dart';
import '../models/products.dart';
import '../models/view_models/product_view_model.dart';
import '../requests/products/product_repository_impl.dart';
import '../utils/navigator/page_navigator.dart';
import '../widgets/image_view.dart';

class Product extends StatelessWidget {
  
  const Product({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<ProductCubit>(
      create: (BuildContext context) => ProductCubit(
          productRepository: ProductRepositoryImpl(),
          viewModel: Provider.of<ProductViewModel>(context, listen: false)
          ),
      child:const  ProductsScreen());
}

class ProductsScreen
 extends StatefulWidget {
  const ProductsScreen
  ({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  late ProductCubit _productCubit;

  List<Products> products = [];

  @override
  void initState() {
   _productCubit = context.read<ProductCubit>();

    _productCubit.getProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: const Text('Find Products', style: TextStyle(color: AppColors.black),)),

          body:   BlocConsumer<ProductCubit, ProductStates>(
        listener: (context, state) {},
        builder: (context, state) {
         
          if (state is ProductLoading) {
            return const Center(child:  CircularProgressIndicator());
          } else if (state is ProductLoaded) {

          products =  _productCubit.viewModel.product;
           

            
          } else if (state is ProductApiErr) {
            if (state.message != null) {}
          } else if (state is ProductNetworkErr) {
            if (state.message != null) {}
          }
            return SingleChildScrollView(
              child: 
              
             SizedBox(
              height: MediaQuery.sizeOf(context).height +150,
               child: GridView.builder(
                   itemCount: products.length,
                   itemBuilder: (context, index) {
                   final item = products[index]; 
                     return GestureDetector(
                      onTap: (){
                        AppNavigator.pushAndStackPage(context,
                        page:  ProductDetail(
                          productId: item.id ?? '',
                        ));
                      },
                       child: Container(
                        margin: const  EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border:  Border.all(color: Colors.green, width: 1)),
                         child:   Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                      const SizedBox(height: 15,),
                                       ImageView.network(item.image),
                                      const SizedBox(height: 15,),
                            Align(child: Text(
                            
                              item.name ?? '', textAlign: TextAlign.center,)),
                                     ],
                         ),
                       ),
                     );
                   },
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     childAspectRatio: 0.8  ,
                   ),
                 ),
             )
              
             
            );
            },
          ),
    );
    
  }
}
