
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AddToFavouritsResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/AllProductsResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/AuthRegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoriesResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/ErrorResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/Failures.dart';
import 'package:e_commerce_app/domain/entities/GetCartItemsResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/GetFavouritsTabResponseEntity.dart';
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

  @override
  Future<Either<Failures, AddToCartResponseEntity>> AddToCart(String productID) {

    return registerRemoteDataSourceInterface.getAddToCart(productID);
  }

  @override
  Future<Either<Failures, GetCartItemsResponseEntity>> getCartItems() {

    return registerRemoteDataSourceInterface.getCartItemsToCart();
  }

  @override
  Future<Either<Failures, GetCartItemsResponseEntity>> deleteCartItem(String productID) {
    return registerRemoteDataSourceInterface.deleteCartItem(productID);
  }

  @override
  Future<Either<Failures, AddToFavouritsResponseEntity>> AddToFavourits(String productID) {
    return registerRemoteDataSourceInterface.AddToFavourits(productID);
  }

  @override
  Future<Either<Failures, GetFavouritsTabResponseEntity>> getFavouritsItems() {
    return registerRemoteDataSourceInterface.getFavouritsItems();
  }

  @override
  Future<Either<Failures, AddToFavouritsResponseEntity>> deleteItemFromFavs(String productID) {
    return registerRemoteDataSourceInterface.deleteItemFromFavs(productID);
  }

  @override
  Future<Either<Failures, GetCartItemsResponseEntity>> updateCartItem(String productID, int newQuantity) {
    return registerRemoteDataSourceInterface.updateCartItem(productID, newQuantity);
  }
  
}