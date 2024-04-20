
import 'package:e_commerce_app/domain/dependency_injection.dart';
import 'package:e_commerce_app/ui/cubit/home/cart/cartScreenStates.dart';
import 'package:e_commerce_app/ui/cubit/home/cart/cartScreenViewModel.dart';
import 'package:e_commerce_app/ui/cubit/home/cart/cartitem_design_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/productDdetails/addtocart_price_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/api_manager/apiConstants.dart';
import '../../../../domain/custom_alertdialog.dart';
import '../../../../domain/sharedpreferences.dart';
import '../../../utiles/app_assets.dart';
import '../../../utiles/colors.dart';
import '../categoriesTab/items_list_widget.dart';
import '../homeTab/searchAndCartWidget.dart';

class CartScreen extends StatefulWidget {

  static String routeName="CartScreen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //var cartItemsCount='';

  @override
  void initState() {
    super.initState();
    //cartItemsCount=SharedPreferenceClass.getData(AppConstants.cartItemsCount).toString();
  }

  CartScreenViewModel cartScreenViewModel=CartScreenViewModel(cartUseCase: cartUseCaseInjection());
  @override
  Widget build(BuildContext context) {
    //cartItemsCount=cartScreenViewModel.countcartItems.toString();
    return BlocBuilder<CartScreenViewModel,CartScreenStates>(
      bloc: cartScreenViewModel..getAllCartItems(),
        builder: (context,state){
        return Theme(
          data: Theme.of(context).copyWith(
            //canvasColor: AppColors.PrimaryColor,
            iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: MaterialStatePropertyAll(AppColors.PrimaryColor))),
          ),
          child: Scaffold(
            appBar:
            AppBar(backgroundColor: Colors.white,title: Text("Cart",style: TextStyle(color: AppColors.PrimaryColor),),centerTitle: true, actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search,color: AppColors.PrimaryColor,)),
              IconButton(onPressed: (){}, icon: Badge(
                  label: Text("${cartScreenViewModel.countcartItems}"),
                  child: Icon(Icons.shopping_cart_outlined,color: AppColors.PrimaryColor,))),

            ],),
            body: Padding(padding: EdgeInsets.only(top: 12.h,left: 16.w,right: 16.w,bottom: 12.h),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  (state is CartScreenSuccessState)?Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.cartItemsList.length,
                        itemBuilder: (context,index){
                          return CartItemDesignWidget(cartItem: state.cartItemsList[index],onDeleteClickListener: (productId){
                            cartScreenViewModel.deleteCartItem(productId);
                            CustomAlertDialog.ShowCustomeDialog(context: context, content: "Item Deleted Successfully",postitveActionTxt: "Ok");
                          },onDecrementClickListener: (productID,newQuantity){
                            cartScreenViewModel.updateCartItem(productID, newQuantity);
                          },onIncrementClickListener: (productID,newQuantity){
                            cartScreenViewModel.updateCartItem(productID, newQuantity);
                          },);
                        }),
                  ):
                      Center(child: CircularProgressIndicator(),),
                  SizedBox(height: 12.h,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Text("Total Price",style: TextStyle(color: AppColors.PrimaryColor),),
                        Text("EGP ${cartScreenViewModel.totalPrice}",style: TextStyle(color: AppColors.PrimaryColor,fontWeight: FontWeight.bold,fontSize: 16),)
                      ],),
                      Container(padding:EdgeInsets.symmetric(vertical: 12.h,horizontal: 15.w),decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),border: Border.all(color: AppColors.PrimaryColor),color: AppColors.PrimaryColor),
                        child: Row(children: [
                          Icon(Icons.add_shopping_cart,color: Colors.white,),
                          SizedBox(width: 12.w,),
                          Text("Add To Cart",style: TextStyle(color: Colors.white),)],),)
                    ],)
                ],),
            ),),
        );
        });
  }
}
/*
 Theme(
      data: Theme.of(context).copyWith(
        iconTheme: IconThemeData(color: AppColors.PrimaryColor)
      ),
      child: Scaffold(
        appBar:
        AppBar(backgroundColor: Colors.white,title: Text("Cart",style: TextStyle(color: AppColors.PrimaryColor),),centerTitle: true, actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color: AppColors.PrimaryColor,)),
          IconButton(onPressed: (){}, icon: Badge(
            label: Text("${cartItemsCount}"),
              child: Icon(Icons.shopping_cart_outlined,color: AppColors.PrimaryColor,))),

        ],),
        body: Padding(padding: EdgeInsets.only(top: 12.h,left: 16.w,right: 16.w,bottom: 12.h),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                    itemCount: 16,
                    itemBuilder: (context,index){
                  return CartItemDesignWidget();
                }),
              ),
              SizedBox(height: 12.h,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Text("Total Price",style: TextStyle(color: AppColors.PrimaryColor),),
                    Text("EGP ",style: TextStyle(color: AppColors.PrimaryColor,fontWeight: FontWeight.bold,fontSize: 16),)
                  ],),
                  Container(padding:EdgeInsets.symmetric(vertical: 12.h,horizontal: 15.w),decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),border: Border.all(color: AppColors.PrimaryColor),color: AppColors.PrimaryColor),
                    child: Row(children: [
                      Icon(Icons.add_shopping_cart,color: Colors.white,),
                      SizedBox(width: 12.w,),
                      Text("Add To Cart",style: TextStyle(color: Colors.white),)],),)
                ],)
            ],),
        ),)
 */