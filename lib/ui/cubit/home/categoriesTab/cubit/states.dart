

import '../../../../../domain/entities/AllProductsResponseEntity.dart';
import '../../cart/cartScreenStates.dart';

abstract class AllProductsStates {}

class AllProductsInitialState extends AllProductsStates{}
class AllProductsLoadingState extends AllProductsStates{
  String LoadingMsg;
  AllProductsLoadingState({required this.LoadingMsg});
}
class AllProductsSuccessState extends AllProductsStates{
  List<ProductsDataEntity> productsDataList;
  AllProductsSuccessState({required this.productsDataList});
}
class AllProductsFailureState extends AllProductsStates{
  String FailureMsg;
  AllProductsFailureState({required this.FailureMsg});
}
class ItemAddedToCartSuccessfullyState extends AllProductsStates{
  String successMsg;
  ItemAddedToCartSuccessfullyState({required this.successMsg});
}
class ItemAddedToCartErrorState extends AllProductsStates{
  String errorMsg;
  ItemAddedToCartErrorState({required this.errorMsg});
}

class ItemAddedToFavouritsSuccessfullyState extends AllProductsStates{
  String successMsg;
  ItemAddedToFavouritsSuccessfullyState({required this.successMsg});
}
class ItemAddedToFavouritsErrorState extends AllProductsStates{
  String errorMsg;
  ItemAddedToFavouritsErrorState({required this.errorMsg});
}
