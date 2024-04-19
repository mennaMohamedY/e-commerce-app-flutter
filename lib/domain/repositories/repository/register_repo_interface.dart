
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AddToFavouritsResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/AllProductsResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoriesResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/Failures.dart';
import 'package:e_commerce_app/domain/entities/GetCartItemsResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/GetFavouritsTabResponseEntity.dart';

import '../../entities/AuthRegisterResponseEntity.dart';
import '../../entities/ErrorResponseEntity.dart';

abstract class RegisterRepositoryInterface{
  Future<Either<Failures,AuthRegisterResponseEntity>> Register(String fullName,String phoneNum,String email,String passWord,String repassword);

  Future<Either<Failures,AuthRegisterResponseEntity>> Login(String email,String passWord);

  Future<Either<Failures,CategoriesResponseEntity>> Categories();
  Future<Either<Failures,CategoriesResponseEntity>> brandso();

  Future<Either<Failures,AllProductsResponseEntity>> allProducts();

  Future<Either<Failures,AddToCartResponseEntity>> AddToCart(String productID);
  Future<Either<Failures,GetCartItemsResponseEntity>> getCartItems();
  Future<Either<Failures,GetCartItemsResponseEntity>> deleteCartItem(String productID);

  Future<Either<Failures,AddToFavouritsResponseEntity>> AddToFavourits(String productID);
  Future<Either<Failures,GetFavouritsTabResponseEntity>> getFavouritsItems();




}