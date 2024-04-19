

import 'package:e_commerce_app/domain/entities/GetCartItemsResponseEntity.dart';

import '../categoriesTab/cubit/states.dart';

class CartScreenStates {}

class CartScreenLoadingState extends CartScreenStates{}

class CartScreenSuccessState extends CartScreenStates{
  List<GetCartItemsProducts> cartItemsList;
  CartScreenSuccessState({required this.cartItemsList});
}

class CartScreenFailureState extends CartScreenStates{
  String failureMsg;
  CartScreenFailureState({required this.failureMsg});
}
