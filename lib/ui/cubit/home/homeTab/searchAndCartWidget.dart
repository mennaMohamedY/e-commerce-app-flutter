

import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAndCartWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Expanded(flex: 7,child: SearchBar(
        leading: Icon(Icons.search, color: AppColors.PrimaryColor,),
        shape: MaterialStatePropertyAll(

          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r),side: BorderSide( width: 1,color: AppColors.PrimaryColor))

      ),hintText: "what do you search for?",),
      ),
      Expanded(flex:1,child: Icon(Icons.shopping_cart_outlined,color: AppColors.PrimaryColor,size: 24,)
      )
    ],);
  }
}
