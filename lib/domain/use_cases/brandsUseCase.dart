

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/CategoriesResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/Failures.dart';

import '../repositories/repository/register_repo_interface.dart';

class BrandsUseCase{
  RegisterRepositoryInterface registerRepositoryInterface;
  BrandsUseCase({required this.registerRepositoryInterface});

  Future<Either<Failures,CategoriesResponseEntity>> getBrands(){
    return registerRepositoryInterface.brandso();
  }


}