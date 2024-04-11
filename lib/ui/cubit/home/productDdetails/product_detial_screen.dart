

import 'package:e_commerce_app/ui/cubit/home/productDdetails/addtocart_price_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/productDdetails/product_details_slider_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/productDdetails/productrate_row_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/productDdetails/size_selector_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/productDdetails/titlesTxt_row_widget.dart';
import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utiles/app_assets.dart';

class ProductDetailsScreen extends StatelessWidget {
  static String routeName="ProductDetailsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
    AppBar(backgroundColor: Colors.white,title: Text("Product Details",style: TextStyle(color: AppColors.PrimaryColor),),centerTitle: true, actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.search,color: AppColors.PrimaryColor,)),
      IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined,color: AppColors.PrimaryColor,)),

    ],),
    body: Padding(padding: EdgeInsets.only(top: 12.h,left: 16.w,right: 16.w,bottom: 12.h),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          ProductDetailsSliderWidget(),
          SizedBox(height: 24.h,),
          TitlesTextRowWidget(title: "Product Name",price: "EGP 1,500",),
          SizedBox(height: 12.h,),
          ProductRateRowWidget(),
          SizedBox(height: 12.h,),
          Text("Description",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: 12.h,),
            SizedBox(height: MediaQuery.of(context).size.height*.11,child:
              SingleChildScrollView(child: Text("product descriptions sajdiohsudhfufhjdshajjjjjjjjjfhdafhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhsjjjjjjjjjncsdancsaaaaaaaaanssssssssssssssssssssssssssssssssssssssxsnxxxxxxxxxxxx"),),),
            SizedBox(height: 12.h,),
            Text("Size",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ///sizes
            SizeSelector( sizes: ["Xl","Small","XXL"], selectedSize: "Small", onSizeSelected: (String){}),
            SizedBox(height: 12.h,),
            Text("Color",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ///colors
            SizedBox(height: 12.h,),
            AddToCartAndPriceWidget()




          ],),
      ),
    ),);
  }
}

/*
Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            //sizedbox or give height
            ProductDetailsSliderWidget(),
            Padding(padding:EdgeInsets.all(4.h),child: Image.asset(AppAssets.selectedFavouritsTabIconPath))
          ],),
 */
