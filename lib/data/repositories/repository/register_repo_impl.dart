
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AllProductsResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/AuthRegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoriesResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/ErrorResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/Failures.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/register_datasource_interface.dart';
import 'package:e_commerce_app/domain/repositories/repository/register_repo_interface.dart';

class RegisterRepositoryImpl extends RegisterRepositoryInterface{
  RegisterRemoteDataSourceInterface registerRemoteDataSourceInterface;


  RegisterRepositoryImpl({required this.registerRemoteDataSourceInterface});
  
  @override
  Future<Either<Failures, AuthRegisterResponseEntity>> Register(String fullName, String phoneNum, String email, String passWord,String repassword) {
    return registerRemoteDataSourceInterface.Register(fullName, phoneNum, email, passWord,repassword);
    //return response;
  }

  @override
  Future<Either<Failures, AuthRegisterResponseEntity>> Login(String email, String passWord) {

    return registerRemoteDataSourceInterface.Login(email, passWord) ;
  }

  @override
  Future<Either<Failures, CategoriesResponseEntity>> Categories() {
    return registerRemoteDataSourceInterface.Categories();
  }

  @override
  Future<Either<Failures, CategoriesResponseEntity>> brandso() {

    return registerRemoteDataSourceInterface.brandss();
  }

  @override
  Future<Either<Failures, AllProductsResponseEntity>> allProducts() {
    return registerRemoteDataSourceInterface.allProducts();
  }
  
}