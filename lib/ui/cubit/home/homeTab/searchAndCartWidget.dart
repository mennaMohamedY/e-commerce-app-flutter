

import 'package:e_commerce_app/data/api_manager/apiConstants.dart';
import 'package:e_commerce_app/domain/sharedpreferences.dart';
import 'package:e_commerce_app/ui/cubit/home/cart/cart_screen.dart';
import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAndCartWidget extends StatefulWidget {

  String cartItemsCount;
  @override
  State<SearchAndCartWidget> createState() => _SearchAndCartWidgetState();
  SearchAndCartWidget({required this.cartItemsCount});
}

class _SearchAndCartWidgetState extends State<SearchAndCartWidget> {
  //var cartItemsCount=SharedPreferenceClass.getData(AppConstants.cartItemsCount).toString();

  @override
  Widget build(BuildContext context) {
    //cartItemsCount
    print("cart Items count =${widget.cartItemsCount}");

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Expanded(flex: 3,child: SearchBar(
        leading: Icon(Icons.search, color: AppColors.PrimaryColor,),
        shape: MaterialStatePropertyAll(

          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r),side: BorderSide( width: 1,color: AppColors.PrimaryColor))

      ),hintText: "what do you search for?",),
      ),
        //${cartItemsCount??0}
        InkWell(onTap: (){
          Navigator.pushNamed(context, CartScreen.routeName);
        },child: Padding(padding:EdgeInsets.all(7),child: Badge(label:Text("${widget.cartItemsCount}"),child: Icon(Icons.shopping_cart_outlined,color: AppColors.PrimaryColor,size: 29,))))

        // Expanded(flex:1,child:
        // Badge(label:Text("${cartItemsCount}"),child: Icon(Icons.shopping_cart_outlined,color: AppColors.PrimaryColor,size: 24,))
        // ),
        ,SizedBox(width: 12.w,)
    ],);
  }
}
