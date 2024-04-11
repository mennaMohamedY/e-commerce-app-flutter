
import 'package:e_commerce_app/data/api_manager/apiManager.dart';
import 'package:e_commerce_app/data/repositories/data_source/register_datasource_impl.dart';
import 'package:e_commerce_app/data/repositories/repository/register_repo_impl.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/register_datasource_interface.dart';
import 'package:e_commerce_app/domain/repositories/repository/register_repo_interface.dart';
import 'package:e_commerce_app/domain/use_cases/LoginUseCase.dart';
import 'package:e_commerce_app/domain/use_cases/allProductsUseCase.dart';
import 'package:e_commerce_app/domain/use_cases/brandsUseCase.dart';
import 'package:e_commerce_app/domain/use_cases/categoriesUseCase.dart';
import 'package:e_commerce_app/domain/use_cases/register.dart';

///viewmodel -> usecase
///usecase -> repository interface
///repository -> datasource interface
///datasource -> apiManager


RegisterUseCase registerUseCaseInjection(){
  return RegisterUseCase(registerRepositoryInterface: registerRepositoryInterfaceInjection());
}

LoginUseCase loginUseCaseInjection(){
  return LoginUseCase(registerRepositoryInterface: registerRepositoryInterfaceInjection());
}

CategoriesUserCase categoriesUseCaseInjection(){
  return CategoriesUserCase(registerRepositoryInterface: registerRepositoryInterfaceInjection());
}

AllProductsUseCase allProductsUseCaseInjection(){
  return AllProductsUseCase(registerRepositoryInterface: registerRepositoryInterfaceInjection());
}


BrandsUseCase brandsUseCaseInjection(){
  return BrandsUseCase(registerRepositoryInterface: registerRepositoryInterfaceInjection());
}

RegisterRepositoryInterface registerRepositoryInterfaceInjection(){
  return RegisterRepositoryImpl(registerRemoteDataSourceInterface: registerRemoteDataSourceInterfaceInjection());
}

RegisterRemoteDataSourceInterface registerRemoteDataSourceInterfaceInjection(){
  return RegisterRemoteDataSourceImpl(apiManager: apiManager);
}
ApiManager apiManager=ApiManager.getInstance();