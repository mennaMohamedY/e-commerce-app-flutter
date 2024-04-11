

import '../../../../../domain/entities/AllProductsResponseEntity.dart';

abstract class AllProductsStates{}

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