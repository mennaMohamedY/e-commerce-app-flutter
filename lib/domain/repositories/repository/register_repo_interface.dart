
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AllProductsResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoriesResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/Failures.dart';

import '../../entities/AuthRegisterResponseEntity.dart';
import '../../entities/ErrorResponseEntity.dart';

abstract class RegisterRepositoryInterface{
  Future<Either<Failures,AuthRegisterResponseEntity>> Register(String fullName,String phoneNum,String email,String passWord,String repassword);

  Future<Either<Failures,AuthRegisterResponseEntity>> Login(String email,String passWord);

  Future<Either<Failures,CategoriesResponseEntity>> Categories();
  Future<Either<Failures,CategoriesResponseEntity>> brandso();

  Future<Either<Failures,AllProductsResponseEntity>> allProducts();


}