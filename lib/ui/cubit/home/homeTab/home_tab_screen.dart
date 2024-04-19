
import 'package:e_commerce_app/domain/dependency_injection.dart';
import 'package:e_commerce_app/ui/cubit/home/homeTab/categorieslist_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/homeTab/category_design_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/homeTab/commercials_slider_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/homeTab/cubit/homeTabStates.dart';
import 'package:e_commerce_app/ui/cubit/home/homeTab/cubit/homeTabViewModel.dart';
import 'package:e_commerce_app/ui/cubit/home/homeTab/searchAndCartWidget.dart';
import 'package:e_commerce_app/ui/cubit/home/homeTab/titlesTxt_row_widget.dart';
import 'package:e_commerce_app/ui/utiles/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/api_manager/apiConstants.dart';
import '../../../../domain/sharedpreferences.dart';

class HomeTabScreen extends StatefulWidget {

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  HomeTabViewModel homeTabViewModel=HomeTabViewModel(categoriesUseCase: categoriesUseCaseInjection(),brandsUseCase: brandsUseCaseInjection());

  var cartItemsCount='';
  @override
  void initState() {
    super.initState();
    //homeTabViewModel.getCategories();
    cartItemsCount=SharedPreferenceClass.getData(AppConstants.cartItemsCount).toString();

  }
  @override
  Widget build(BuildContext context) {
    cartItemsCount=SharedPreferenceClass.getData(AppConstants.cartItemsCount).toString();

    return BlocBuilder<HomeTabViewModel,HomeTabStates>(
      bloc: homeTabViewModel..getBrands()..getCategories(),
        builder:(context,state){
      return SafeArea(
        child: Padding(padding: EdgeInsets.only(left: 16),
          child:SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 6.h,bottom: 18.h ),child: Image.asset(AppAssets.routeMarkPath),),
                SearchAndCartWidget(cartItemsCount: cartItemsCount,),
                Padding(padding:EdgeInsets.only(top: 16.h,bottom: 16.h,right: 16.w),child: CommercialsSliderWidget()),
                Padding(padding:EdgeInsets.only(right: 16.h,bottom: 16.h),child: TitlesTextRowWidget(title: "Categories")),
                (homeTabViewModel.categoriesDataList.isEmpty)? CircularProgressIndicator():CategoresListWidget(categoriesResponseData: homeTabViewModel.categoriesDataList!,),
                Padding(padding:EdgeInsets.only(right: 16.h,top: 24.h,bottom: 16.h),child: TitlesTextRowWidget(title: "Brands")),
                (homeTabViewModel.brandsDataList.isEmpty)?CircularProgressIndicator():CategoresListWidget(categoriesResponseData: homeTabViewModel.brandsDataList),
                SizedBox(height: 16.h,)

              ],),
          ) ,),
      );
    });
  }
}

/*
(state is SucessCategoriesState)? CategoresListWidget(categoriesResponseData: state.categoriesResponseEntity.data!,):
                (state is ErrorState)?Text("ErrorState"):
                (state is LoadingState)?CircularProgressIndicator():Text('non of the above!'),

 */
/*
          (state is SucessBrandsState)? CategoresListWidget(categoriesResponseData: state.categoriesBrandsEntity.data!,):
          (state is ErrorBrandsState)?Text("ErrorState"):
          (state is LoadingBrandsState)?CircularProgressIndicator():CircularProgressIndicator(),
 */