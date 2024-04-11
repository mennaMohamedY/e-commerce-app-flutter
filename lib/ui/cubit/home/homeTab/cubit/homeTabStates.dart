
import 'package:e_commerce_app/domain/entities/CategoriesResponseEntity.dart';

abstract class HomeTabStates{}
class LoadingState extends HomeTabStates{
  String LoadingMessage;
  LoadingState({required this.LoadingMessage});
}
class SucessCategoriesState extends HomeTabStates{

  CategoriesResponseEntity categoriesResponseEntity;
  SucessCategoriesState({required this.categoriesResponseEntity});
}

class ErrorState extends HomeTabStates{
  String errorMsg;
  ErrorState({required this.errorMsg});
}

class LoadingBrandsState extends HomeTabStates{
  String LoadingMessage;
  LoadingBrandsState({required this.LoadingMessage});
}

class SucessBrandsState extends HomeTabStates{

  CategoriesResponseEntity categoriesBrandsEntity;
  SucessBrandsState({required this.categoriesBrandsEntity});
}

class ErrorBrandsState extends HomeTabStates{
  String errorMsg;
  ErrorBrandsState({required this.errorMsg});
}