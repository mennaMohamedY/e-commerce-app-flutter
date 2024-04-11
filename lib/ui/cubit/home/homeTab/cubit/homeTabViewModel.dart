
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/CategoriesResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/Failures.dart';
import 'package:e_commerce_app/ui/cubit/home/homeTab/cubit/homeTabStates.dart';

import '../../../../../domain/repositories/repository/register_repo_interface.dart';
import '../../../../../domain/use_cases/brandsUseCase.dart';
import '../../../../../domain/use_cases/categoriesUseCase.dart';

class HomeTabViewModel extends Cubit<HomeTabStates>{


  CategoriesUserCase categoriesUseCase;
  BrandsUseCase brandsUseCase;
  HomeTabViewModel({required this.categoriesUseCase, required this.brandsUseCase}):super(LoadingState(LoadingMessage: "Loading"));

  List<DataEntity> categoriesDataList=[];

  void getCategories()async{
    emit(LoadingState(LoadingMessage: "Loading...."));
    var either =await categoriesUseCase.getCategories();
    either.fold(
            (l) => emit(ErrorState(errorMsg: "${l.errorMsg}")),
            (r) {
              categoriesDataList=r.data??[];
              emit(SucessCategoriesState(categoriesResponseEntity: r));
            }
    );
  }

  List<DataEntity> brandsDataList=[];

  void getBrands()async{
    emit(LoadingBrandsState(LoadingMessage: "Loading..."));
    var either =await brandsUseCase.getBrands();
    either.fold(
            (l) => emit(ErrorBrandsState(errorMsg: "${l.errorMsg}")),
            (r) {
              brandsDataList=r.data??[];
              print('${brandsDataList.length}');
              emit(SucessBrandsState(categoriesBrandsEntity: r));
            }
    );
  }
}