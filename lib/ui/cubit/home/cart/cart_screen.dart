
import 'package:e_commerce_app/ui/cubit/home/cart/cartitem_design_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/productDdetails/addtocart_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utiles/app_assets.dart';
import '../../../utiles/colors.dart';
import '../categoriesTab/items_list_widget.dart';
import '../homeTab/searchAndCartWidget.dart';

class CartScreen extends StatelessWidget {

  static String routeName="CartScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(backgroundColor: Colors.white,title: Text("Cart",style: TextStyle(color: AppColors.PrimaryColor),),centerTitle: true, actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search,color: AppColors.PrimaryColor,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined,color: AppColors.PrimaryColor,)),

      ],),
      body: Padding(padding: EdgeInsets.only(top: 12.h,left: 16.w,right: 16.w,bottom: 12.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex:8,child: SingleChildScrollView(child: Column(children: [
              CartItemDesignWidget()
            ],),)),
            Expanded(flex:1,child: AddToCartAndPriceWidget())
          ],),
      ),);
  }
}
