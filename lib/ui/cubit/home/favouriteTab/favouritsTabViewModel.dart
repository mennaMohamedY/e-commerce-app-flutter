
import 'package:bloc/bloc.dart';

import '../../../../data/api_manager/apiConstants.dart';
import '../../../../domain/entities/GetFavouritsTabResponseEntity.dart';
import '../../../../domain/sharedpreferences.dart';
import '../../../../domain/use_cases/cartUseCase.dart';
import '../../../../domain/use_cases/favouritUseCase.dart';
import 'favourits_states.dart';

class FavouritsTabViewModel extends Cubit<FavouritsTabStates>{

  FavouritUseCase favouriteUseCase;
  CartUseCase cartUseCase;
  FavouritsTabViewModel({required this.favouriteUseCase,required this.cartUseCase}):super(FavouritsTabLoadingState());
  List<FavouritsDataEntity> favouritItemsList=[];

  void getFavouritsItems()async {

    emit(FavouritsTabLoadingState());
    var either=await favouriteUseCase.GetFavouritsItems();
    either.fold(
            (l) => emit(FavouritsTabFailureState(failureMsg: "Failed to load data ${l.errorMsg}")),
            (r) {
              favouritItemsList=r.data??[];
              emit(FavouritsTabSuccessState(favouritItemsList: r.data??[]));
            });
  }

  void addItemToCart(String productID)async{
    var either= await cartUseCase.AddItemsToCart(productID);
    either.fold(
            (l) {
          emit(ItemAddedErrorState(errorMsg: "${l.errorMsg!}"));
        },
            (r) {
          //cartItemsCount=r.numOfCartItems!.toInt();
          SharedPreferenceClass.saveData(AppConstants.cartItemsCount, r.numOfCartItems!.toInt());
          var cartItemsCount=SharedPreferenceClass.getData(AppConstants.cartItemsCount).toString();
          print("in categorys vm cartitemscount----->${cartItemsCount}");
          emit(ItemAddedToCartSuccessState(successMsg: "Item Added to Cart Successfully"));
        });
  }


}


