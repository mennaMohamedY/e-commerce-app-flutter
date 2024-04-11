



import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repositories/repository/register_repo_interface.dart';

import '../entities/AllProductsResponseEntity.dart';
import '../entities/Failures.dart';

class AllProductsUseCase{
  RegisterRepositoryInterface registerRepositoryInterface;
  AllProductsUseCase({required this.registerRepositoryInterface});


  Future<Either<Failures, AllProductsResponseEntity>> getAllProducts(){
    return registerRepositoryInterface.allProducts();
  }
  
}
