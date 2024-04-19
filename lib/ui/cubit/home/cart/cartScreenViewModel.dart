

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/data/api_manager/apiConstants.dart';
import 'package:e_commerce_app/domain/sharedpreferences.dart';
import 'package:e_commerce_app/ui/cubit/home/cart/cartScreenStates.dart';

import '../../../../domain/entities/GetCartItemsResponseEntity.dart';
import '../../../../domain/use_cases/cartUseCase.dart';
import '../categoriesTab/cubit/states.dart';

class CartScreenViewModel extends Cubit<CartScreenStates>{

  CartUseCase cartUseCase;
  List<GetCartItemsProducts> cartItemsList=[];
  String totalPrice='';

  CartScreenViewModel({required this.cartUseCase}):super(CartScreenLoadingState());

  void getAllCartItems()async{
    var either=await cartUseCase.GetCartItems();

    either.fold(
            (l) {
              emit(CartScreenFailureState(failureMsg: l.errorMsg!));
            },
            (r) {
              totalPrice=r.data!.totalCartPrice.toString();
              cartItemsList=r.data!.products!;
              emit(CartScreenSuccessState(cartItemsList: r.data?.products??[]));
            });
  }
  var countcartItems=SharedPreferenceClass.getData(AppConstants.cartItemsCount);


  void deleteCartItem(String productID)async{
    var either=await cartUseCase.deleteCartItem(productID);

    either.fold(
            (l) {
          emit(CartScreenFailureState(failureMsg: l.errorMsg!));
        },
            (r) {
          totalPrice=r.data!.totalCartPrice.toString();
          cartItemsList=r.data!.products!;
          SharedPreferenceClass.saveData(AppConstants.cartItemsCount, r.data?.products?.length.toInt());
          countcartItems=SharedPreferenceClass.getData(AppConstants.cartItemsCount);
          print("countcartItems ${countcartItems}");
          print("Delete happened cart list length ${r.data?.products?.length}");
          //emit(ItemAddedToCartSuccessfullyState(successMsg: "successMsg"));

          emit(CartScreenSuccessState(cartItemsList: r.data?.products??[]));

            });
  }
}