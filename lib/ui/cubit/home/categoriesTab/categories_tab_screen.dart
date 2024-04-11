
import 'package:e_commerce_app/domain/dependency_injection.dart';
import 'package:e_commerce_app/ui/cubit/home/categoriesTab/cubit/categoriesTabViewModel.dart';
import 'package:e_commerce_app/ui/cubit/home/categoriesTab/cubit/states.dart';
import 'package:e_commerce_app/ui/cubit/home/categoriesTab/items_list_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/homeTab/searchAndCartWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utiles/app_assets.dart';

class CategoriesTabScreen extends StatefulWidget {


  @override
  State<CategoriesTabScreen> createState() => _CategoriesTabScreenState();
}

class _CategoriesTabScreenState extends State<CategoriesTabScreen> {
  CategoriesTabViewModel categoriesTabViewModel=CategoriesTabViewModel(allProductsUseCase: allProductsUseCaseInjection());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesTabViewModel,AllProductsStates>(
      bloc: categoriesTabViewModel..getAllProducts(),
        builder: (context,state){
        return SafeArea(
          child: Padding(padding: EdgeInsets.only(left: 16),
            child:SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 6.h,bottom: 18.h ),child: Image.asset(AppAssets.routeMarkPath),),
                  SearchAndCartWidget(),

                  (categoriesTabViewModel.productsDataList.isEmpty)?Center(child: CircularProgressIndicator(),):
                  ItemsListWidget(productsDataList: categoriesTabViewModel.productsDataList,),
                  //(state is AllProductsSuccessState )?Text("length-> ${state.productsDataList.length}"):Text("0")

                  SizedBox(height: MediaQuery.of(context).size.height*0.2,)



                ],),
            ) ,),
        );
        });

  }
}

/*
SafeArea(
      child: Padding(padding: EdgeInsets.only(left: 16),
        child:SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 6.h,bottom: 18.h ),child: Image.asset(AppAssets.routeMarkPath),),
              SearchAndCartWidget(),
              ItemsListWidget()



            ],),
        ) ,),
    );
 */
