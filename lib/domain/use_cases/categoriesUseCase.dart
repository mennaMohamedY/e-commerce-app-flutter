

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/CategoriesResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/Failures.dart';

import '../repositories/repository/register_repo_interface.dart';

class CategoriesUserCase{
  RegisterRepositoryInterface registerRepositoryInterface;
  CategoriesUserCase({required this.registerRepositoryInterface});

   Future<Either<Failures,CategoriesResponseEntity>> getCategories(){
    return registerRepositoryInterface.Categories();
  }



}