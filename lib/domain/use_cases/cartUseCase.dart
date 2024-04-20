
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/GetCartItemsResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/repository/register_repo_interface.dart';

import '../entities/AddToCartResponseEntity.dart';
import '../entities/Failures.dart';

class CartUseCase{
  RegisterRepositoryInterface registerRepositoryInterface;
  CartUseCase({required this.registerRepositoryInterface});

  Future<Either<Failures, AddToCartResponseEntity>> AddItemsToCart(String productID){
    return registerRepositoryInterface.AddToCart(productID);
  }

  Future<Either<Failures,GetCartItemsResponseEntity>> GetCartItems(){
    return registerRepositoryInterface.getCartItems();
  }

  Future<Either<Failures,GetCartItemsResponseEntity>> deleteCartItem(String productID){
    return registerRepositoryInterface.deleteCartItem(productID);
  }

  Future<Either<Failures,GetCartItemsResponseEntity>> updateCartItem(String productID,int newQuantity){
    return registerRepositoryInterface.updateCartItem(productID,newQuantity);
  }
}