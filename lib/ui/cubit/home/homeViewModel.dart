
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/ui/cubit/home/home_screen_states.dart';
import 'package:e_commerce_app/ui/cubit/home/profileTab/profile_tab_screen.dart';
import 'package:e_commerce_app/ui/cubit/register/register_states.dart';
import 'package:flutter/material.dart';

import 'categoriesTab/categories_tab_screen.dart';
import 'favouriteTab/favourite_tab_screen.dart';
import 'homeTab/home_tab_screen.dart';

class HomeViewModel extends Cubit<HomeScreenStates>{
  HomeViewModel():super(initialHomeScreenState());

  var selectedTabIndex=0;
  List<Widget> TabsList= [HomeTabScreen(),CategoriesTabScreen(),FavouriteTabScreen(),ProfileTabScreen()];

  void changeTabIndex(int newIndex){
    emit(initialHomeScreenState());
    selectedTabIndex=newIndex;
    emit(initialHomeScreenState());
  }

}