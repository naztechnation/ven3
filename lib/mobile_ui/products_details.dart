

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ven/res/app_colors.dart';
import 'package:ven/res/app_images.dart';
import 'package:ven/widgets/image_view.dart';

import '../blocs/account/product.dart';
import '../blocs/account/product_cubit.dart';
import '../models/products_details.dart';
import '../models/view_models/product_view_model.dart';
import '../requests/products/product_repository_impl.dart';

class ProductDetail extends StatelessWidget {
  final String productId;
  
  const ProductDetail({Key? key, required this.productId,})
      : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<ProductCubit>(
      create: (BuildContext context) => ProductCubit(
          productRepository: ProductRepositoryImpl(),
          viewModel: Provider.of<ProductViewModel>(context, listen: false)
          ),
      child:   ProductsDetailsScreen(productId: productId,));
}

class ProductsDetailsScreen extends StatefulWidget {
  final String productId;

  const ProductsDetailsScreen({super.key, required this.productId});

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {

  late ProductCubit _productCubit;

  ProductDetails? products;

  @override
  void initState() {
   _productCubit = context.read<ProductCubit>();

    _productCubit.getProductsDetails(productId: widget.productId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_sharp,  color: Colors.black,)),
        actions: const [
        ImageView.svg(AppImages.upload),
        SizedBox(width: 20,)
      ]),
      body:  BlocConsumer<ProductCubit, ProductStates>(
        listener: (context, state) {},
        builder: (context, state) {
         
          if (state is ProductLoading) {
            return const Center(child:  CircularProgressIndicator());
          } else if (state is ProductLoaded) {

          products =  _productCubit.viewModel.productDetail;
           

            
          } else if (state is ProductApiErr) {
            if (state.message != null) {}
          } else if (state is ProductNetworkErr) {
            if (state.message != null) {}
          }
        return SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: MediaQuery.sizeOf(context).width ,
                child:   ImageView.network(products!.image)),
                const SizedBox(
                height: 30,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(products!.name ?? '', style: const TextStyle(fontSize: 24,fontFamily: 'Gilroy-Bold'),)),
                    const Icon(Icons.favorite_border, size: 28,)
                  ],
                ),
                const  SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              
            },
            icon: const Icon(Icons.remove, size: 34,),
          ),
          Container(
            padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
             decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border:  Border.all(color: Colors.grey, width: 1)),
            child:  Text('${products!.quantity}')),
          IconButton(
            onPressed: () {
              
            },
            icon: const Icon(Icons.add, color: Colors.green,size: 34,),
          ),
        ],
          ),
           Text('${products!.price}', style:const TextStyle(fontSize: 18),)
                  ],
                ),
            const SizedBox(height: 20,),
                Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Product Detail'),
          const SizedBox(width: 10),
          CupertinoButton(
            onPressed: (){},
            child: const Icon(CupertinoIcons.chevron_down, color: Colors.black,size: 24,),
          ),
        ],
          ),
          const SizedBox(height: 20,),
            Text('${products!.description}'),
            ],
            
          ),
        ));
  }),
    );
  }
}