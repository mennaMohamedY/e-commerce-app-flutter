
import 'package:e_commerce_app/domain/dependency_injection.dart';
import 'package:e_commerce_app/ui/cubit/home/favouriteTab/favourititem_design_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/favouriteTab/favouritsTabViewModel.dart';
import 'package:e_commerce_app/ui/cubit/home/favouriteTab/favourits_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/api_manager/apiConstants.dart';
import '../../../../domain/custom_alertdialog.dart';
import '../../../../domain/sharedpreferences.dart';
import '../../../utiles/app_assets.dart';
import '../categoriesTab/items_list_widget.dart';
import '../homeTab/searchAndCartWidget.dart';

class FavouriteTabScreen extends StatefulWidget {


  @override
  State<FavouriteTabScreen> createState() => _FavouriteTabScreenState();
}


class _FavouriteTabScreenState extends State<FavouriteTabScreen> {
  var cartItemsCount='';

  @override
  void initState() {
    super.initState();
    cartItemsCount=SharedPreferenceClass.getData(AppConstants.cartItemsCount).toString();
  }
  
  FavouritsTabViewModel favouritsTabViewModel=FavouritsTabViewModel(favouriteUseCase: favouritUseCaseInjection(),cartUseCase: cartUseCaseInjection());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritsTabViewModel,FavouritsTabStates>(
      bloc: favouritsTabViewModel..getFavouritsItems(),
        builder: (context,state){
          return SafeArea(
            child: Padding(padding: EdgeInsets.only(left: 16.w,right: 16.w),
              child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 6.h,bottom: 18.h ),child: Image.asset(AppAssets.routeMarkPath),),
                  SearchAndCartWidget(cartItemsCount: cartItemsCount,),
                  SizedBox(height: 24.h,),
                  //FavouritItemDesignWidget()
                  //(state is FavouritsTabSuccessState)?
                  favouritsTabViewModel.favouritItemsList!.isEmpty?CircularProgressIndicator():

                  Expanded(
                    child: ListView.builder(scrollDirection:Axis.vertical,
                        itemBuilder: (context,index){
                                  
                      return //Text("hiiii ${favouritsTabViewModel.favouritItemsList?.length}");
                        //favouritsTabViewModel.favouritItemsList![index]
                        FavouritItemDesignWidget(itemData: favouritsTabViewModel.favouritItemsList![index], onaddItemToCartClickListener: (productID){
                          favouritsTabViewModel.addItemToCart(productID);
                          CustomAlertDialog.ShowCustomeDialog(context: context, content: "item added to Cart successfully",postitveActionTxt: "Ok",);
                        },onFavIconClickListener: (productID){
                          favouritsTabViewModel.deleteItemFromFavs(productID);
                          CustomAlertDialog.ShowCustomeDialog(context: context, content: "item Removed from Favourits Successfully",postitveActionTxt: "Ok",);
                        },);
                    },itemCount: favouritsTabViewModel.favouritItemsList?.length,),
                  )
                      //favouritsTabViewModel.favouritItemsList?.length
                  //CircularProgressIndicator()

              
              
                ],) ,),
          );
        });
  }
}
/*
SafeArea(
      child: Padding(padding: EdgeInsets.only(left: 16.w,right: 16.w),
        child:SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 6.h,bottom: 18.h ),child: Image.asset(AppAssets.routeMarkPath),),
              SearchAndCartWidget(cartItemsCount: cartItemsCount,),
              SizedBox(height: 24.h,),
              FavouritItemDesignWidget()


            ],),
        ) ,),
    );
    
    
    
     ListView.builder(itemBuilder: (context,index){

                      return FavouritItemDesignWidget(itemData: state.favouritItemsList![index],);
                    },itemCount: state.favouritItemsList?.length,)
 */
