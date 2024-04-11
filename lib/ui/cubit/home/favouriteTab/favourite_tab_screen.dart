
import 'package:e_commerce_app/ui/cubit/home/favouriteTab/favourititem_design_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utiles/app_assets.dart';
import '../categoriesTab/items_list_widget.dart';
import '../homeTab/searchAndCartWidget.dart';

class FavouriteTabScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(padding: EdgeInsets.only(left: 16.w,right: 16.w),
        child:SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 6.h,bottom: 18.h ),child: Image.asset(AppAssets.routeMarkPath),),
              SearchAndCartWidget(),
              SizedBox(height: 24.h,),
              FavouritItemDesignWidget()


            ],),
        ) ,),
    );
  }
}
