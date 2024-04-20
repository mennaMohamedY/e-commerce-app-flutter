

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AuthRegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/Failures.dart';

import '../../../data/model_DTO/response/AuthRegisterResponse.dart';
import '../../../data/model_DTO/response/ErrorResponse.dart';
import '../../entities/AddToFavouritsResponseEntity.dart';
import '../../entities/AllProductsResponseEntity.dart';
import '../../entities/AddToCartResponseEntity.dart';
import '../../entities/CategoriesResponseEntity.dart';
import '../../entities/GetCartItemsResponseEntity.dart';
import '../../entities/GetFavouritsTabResponseEntity.dart';

abstract class RegisterRemoteDataSourceInterface{
  Future<Either<Failures,AuthRegisterResponseEntity>> Register(String fullName,String phoneNum,String email,String passWord,String repassword);
  Future<Either<Failures,AuthRegisterResponseEntity>> Login(String email,String passWord);

  Future<Either<Failures,CategoriesResponseEntity>> Categories();

  Future<Either<Failures,CategoriesResponseEntity>> brandss();

  Future<Either<Failures,AllProductsResponseEntity>> allProducts();

  Future<Either<Failures,AddToCartResponseEntity>> getAddToCart(String productId);
  Future<Either<Failures,GetCartItemsResponseEntity>> getCartItemsToCart();
  Future<Either<Failures,GetCartItemsResponseEntity>> deleteCartItem(String productID);

  Future<Either<Failures,AddToFavouritsResponseEntity>> AddToFavourits(String productID);
  Future<Either<Failures,GetFavouritsTabResponseEntity>> getFavouritsItems();
  Future<Either<Failures,AddToFavouritsResponseEntity>> deleteItemFromFavs(String productID);

  Future<Either<Failures,GetCartItemsResponseEntity>> updateCartItem(String productID,int newQuantity);







}