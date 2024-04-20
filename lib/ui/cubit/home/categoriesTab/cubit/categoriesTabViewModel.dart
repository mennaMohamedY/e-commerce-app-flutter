
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api_manager/apiConstants.dart';
import 'package:e_commerce_app/domain/sharedpreferences.dart';
import 'package:e_commerce_app/ui/cubit/home/categoriesTab/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entities/AllProductsResponseEntity.dart';
import '../../../../../domain/use_cases/allProductsUseCase.dart';
import '../../../../../domain/use_cases/cartUseCase.dart';
import '../../../../../domain/use_cases/favouritUseCase.dart';
import '../../favouriteTab/favourits_states.dart';

class CategoriesTabViewModel extends Cubit<AllProductsStates>{

  AllProductsUseCase allProductsUseCase;
  CartUseCase  cartUseCase;
  FavouritUseCase favouritUseCase;
  CategoriesTabViewModel({required this.allProductsUseCase,required this.cartUseCase,required this.favouritUseCase}):super(AllProductsInitialState());

  List<ProductsDataEntity> productsDataList=[];
  String  cartItemsCount=SharedPreferenceClass.getData(AppConstants.cartItemsCount).toString();


  void getAllProducts()async {
      emit(AllProductsLoadingState(LoadingMsg: "Loading..."));
      var either=await allProductsUseCase.getAllProducts();
      either.fold(
              (l) => emit(AllProductsFailureState(FailureMsg: "${l.errorMsg}")),
              (r) {
                productsDataList=r.data!;
                emit(AllProductsSuccessState(productsDataList: r.data!));
              });
    }

    static CategoriesTabViewModel creatViewModelObject(context) => BlocProvider.of(context);


    void addItemToCart(String productID)async{
    var either= await cartUseCase.AddItemsToCart(productID);
    either.fold(
            (l) {
              emit(ItemAddedToCartErrorState(errorMsg: "${l.errorMsg!}"));
            },
            (r) {
              //cartItemsCount=r.numOfCartItems!.toInt();
              SharedPreferenceClass.saveData(AppConstants.cartItemsCount, r.numOfCartItems!.toInt());
              cartItemsCount=SharedPreferenceClass.getData(AppConstants.cartItemsCount).toString();
              print("in categorys vm cartitemscount----->${cartItemsCount}");
              emit(ItemAddedToCartSuccessfullyState(successMsg: "Item Added to Cart Successfully"));
            });
    }

  void addItemToFavourit(String productID)async {
    var either=await favouritUseCase.addItemToFavourits(productID);
    either.fold(
            (l) {
          emit(ItemAddedToFavouritsErrorState(errorMsg: "${l.errorMsg!}"));
        },
            (r) {
          //cartItemsCount=r.numOfCartItems!.toInt();
              print("Favourits lengthhhhh > beforee ${r.data?.length}");
              print("in categorys vm cartitemscount----->${cartItemsCount}");
          emit(ItemAddedToFavouritsSuccessfullyState(successMsg: "Item Added to Cart Successfully"));
        });
  }



}