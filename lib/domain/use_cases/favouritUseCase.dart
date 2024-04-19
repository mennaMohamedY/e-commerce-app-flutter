
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AddToFavouritsResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/Failures.dart';
import 'package:e_commerce_app/domain/entities/GetFavouritsTabResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/repository/register_repo_interface.dart';

class FavouritUseCase{
  RegisterRepositoryInterface registerRepositoryInterface;
  FavouritUseCase({required this.registerRepositoryInterface});

  Future<Either<Failures,AddToFavouritsResponseEntity>> addItemToFavourits(String productID){
    return registerRepositoryInterface.AddToFavourits(productID);
  }
  Future<Either<Failures,GetFavouritsTabResponseEntity>> GetFavouritsItems(){
    return registerRepositoryInterface.getFavouritsItems();
  }

}