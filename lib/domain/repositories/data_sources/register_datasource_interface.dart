

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AuthRegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/Failures.dart';

import '../../../data/model_DTO/response/AuthRegisterResponse.dart';
import '../../../data/model_DTO/response/ErrorResponse.dart';
import '../../entities/AllProductsResponseEntity.dart';
import '../../entities/CategoriesResponseEntity.dart';

abstract class RegisterRemoteDataSourceInterface{
  Future<Either<Failures,AuthRegisterResponseEntity>> Register(String fullName,String phoneNum,String email,String passWord,String repassword);
  Future<Either<Failures,AuthRegisterResponseEntity>> Login(String email,String passWord);

  Future<Either<Failures,CategoriesResponseEntity>> Categories();

  Future<Either<Failures,CategoriesResponseEntity>> brandss();

  Future<Either<Failures,AllProductsResponseEntity>> allProducts();




}