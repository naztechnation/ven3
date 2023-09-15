import 'package:equatable/equatable.dart';



abstract class ProductStates extends Equatable {
  const ProductStates();
}

class InitialState extends ProductStates {
  const InitialState();
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductStates {
  @override
  List<Object> get props => [];
}



class ProductLoaded extends ProductStates {
  
  const ProductLoaded();
  @override
  List<Object> get props => [];
}


class ProductNetworkErr extends ProductStates {
  final String? message;
  const ProductNetworkErr(this.message);
  @override
  List<Object> get props => [message!];
}

class ProductApiErr extends ProductStates {
  final String? message;
  const ProductApiErr(this.message);
  @override
  List<Object> get props => [message!];
}
