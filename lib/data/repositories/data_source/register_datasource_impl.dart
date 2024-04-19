
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api_manager/apiManager.dart';
import 'package:e_commerce_app/data/model_DTO/response/AuthRegisterResponse.dart';
import 'package:e_commerce_app/data/model_DTO/response/ErrorResponse.dart';
import 'package:e_commerce_app/domain/entities/AddToFavouritsResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/AllProductsResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/AuthRegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoriesResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/Failures.dart';
import 'package:e_commerce_app/domain/entities/GetCartItemsResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/GetFavouritsTabResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/register_datasource_interface.dart';

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSourceInterface{
  ApiManager apiManager;
  RegisterRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AuthRegisterResponseEntity>> Register(String fullName, String phoneNum, String email, String passWord,String repassword) async{

    var either=await apiManager.register(fullName, phoneNum, email, passWord,repassword);

   return either.fold(
            (l) {
              return Left(l);
            },
            (r) {
              return Right(r.convertResponsetoEntity());
            });
  }

  @override
  Future<Either<Failures, AuthRegisterResponseEntity>> Login(String email, String passWord)async {

    var either=await apiManager.Login(email, passWord);
    return either.fold(
            (l) => Left(l),
            (r) => Right(r.convertResponsetoEntity())
    );

  }

  @override
  Future<Either<Failures, CategoriesResponseEntity>> Categories()async {

    var either=await apiManager.getCategories();
    return either.fold(
            (l) {
              print("dsImpl error");
              return Left(l);
            },
            (r) {
              print("dsImpl success ${r.data?.length}");
              return Right(r);
            });

  }

  @override
  Future<Either<Failures, CategoriesResponseEntity>> brandss() async {
    var either=await apiManager.getBrandsApi();
    return either.fold(
            (l) {
              return Left(l);
            },
            (r) {
              print('brandsDM length ${r.data?.length}');
              return Right(r);
            });

  }

  @override
  Future<Either<Failures, AllProductsResponseEntity>> allProducts()async {

    var either = await apiManager.getAllProducts();
    return either.fold(
            (l) => Left(l),
            (r) => Right(r));
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> getAddToCart(String productId)async {

    var either=await apiManager.addItemToCart(productId);
    return either.fold(
            (l) => Left(l),
            (r) => Right(r));
  }


  @override
  Future<Either<Failures, GetCartItemsResponseEntity>> getCartItemsToCart()async {

    var either=await apiManager.getCartItems();
    return either.fold(
            (l) => Left(l),
            (r) => Right(r));
  }

  @override
  Future<Either<Failures, GetCartItemsResponseEntity>> deleteCartItem(String productID)async {

    var either=await apiManager.deleteCartItem(productID);
    return either.fold(
            (l) => Left(l),
            (r) => Right(r));
  }

  @override
  Future<Either<Failures, AddToFavouritsResponseEntity>> AddToFavourits(String productID)async {

    var either= await apiManager.addItemToFavourits(productID);
    return either.fold(
            (l) => Left(l),
            (r) => Right(r));
  }

  @override
  Future<Either<Failures, GetFavouritsTabResponseEntity>> getFavouritsItems()async {
    var either= await apiManager.getFavouritsItems();
    return either.fold(
            (l) => Left(l),
            (r) => Right(r));
  }


}