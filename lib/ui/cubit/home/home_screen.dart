

import 'package:e_commerce_app/ui/cubit/home/categoriesTab/categories_tab_screen.dart';
import 'package:e_commerce_app/ui/cubit/home/favouriteTab/favourite_tab_screen.dart';
import 'package:e_commerce_app/ui/cubit/home/homeViewModel.dart';
import 'package:e_commerce_app/ui/cubit/home/home_screen_states.dart';
import 'package:e_commerce_app/ui/cubit/home/profileTab/profile_tab_screen.dart';
import 'package:e_commerce_app/ui/cubit/register/register_states.dart';
import 'package:e_commerce_app/ui/utiles/app_assets.dart';
import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:e_commerce_app/ui/utiles/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'homeTab/home_tab_screen.dart';

class HomeScreen extends StatefulWidget {

  static String routeName ="HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel=HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel,HomeScreenStates>(
      bloc: homeViewModel,
        builder:(context,state){
        return Scaffold(
            extendBody: true,
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(topLeft:Radius.circular(25.r) ,topRight:Radius.circular(25.r) ),

              child:
              Theme(data: Theme.of(context).copyWith(
                  canvasColor: AppColors.PrimaryColor
              ),child:BottomNavigationBar(

                  currentIndex: homeViewModel.selectedTabIndex,
                  onTap: (index){
                    //homeViewModel.selectedTabIndex=index;
                    //setState(() {});
                    homeViewModel.changeTabIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(icon: (homeViewModel.selectedTabIndex==0)?Image.asset(AppAssets.selectedHomeTabIconPath) :Image.asset(AppAssets.unselectedHomeTabIconPath) ,label: "Home"),
                    BottomNavigationBarItem(icon: (homeViewModel.selectedTabIndex==1)?Image.asset(AppAssets.selectedCategoriesTabIconPath) :Image.asset(AppAssets.unselectedCategoriesTabIconPath) ,label: "Categories"),
                    BottomNavigationBarItem(icon: (homeViewModel.selectedTabIndex==2)?Image.asset(AppAssets.selectedFavouritsTabIconPath) :Image.asset(AppAssets.unselectedFavouritsTabIconPath) ,label: "Favourits"),
                    BottomNavigationBarItem(icon: (homeViewModel.selectedTabIndex==3)?Image.asset(AppAssets.selectedProfileTabIconPath) :Image.asset(AppAssets.unselectedProfileTabIconPath) ,label: "Profile"),

                  ]) ,),),
            body: homeViewModel.TabsList[homeViewModel.selectedTabIndex]);
        });
  }
}


