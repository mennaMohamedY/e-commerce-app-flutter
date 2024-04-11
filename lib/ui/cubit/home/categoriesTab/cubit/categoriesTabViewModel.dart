
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/ui/cubit/home/categoriesTab/cubit/states.dart';

import '../../../../../domain/entities/AllProductsResponseEntity.dart';
import '../../../../../domain/use_cases/allProductsUseCase.dart';

class CategoriesTabViewModel extends Cubit<AllProductsStates>{

  AllProductsUseCase allProductsUseCase;
  CategoriesTabViewModel({required this.allProductsUseCase}):super(AllProductsInitialState());

  List<ProductsDataEntity> productsDataList=[];

  void getAllProducts()async {
      emit(AllProductsLoadingState(LoadingMsg: "Loading..."));
      var either=await allProductsUseCase.getAllProducts();
      either.fold(
              (l) => emit(AllProductsFailureState(FailureMsg: "${l.errorMsg}")),
              (r) {
                productsDataList=r.data!;
                emit(AllProductsSuccessState(productsDataList: r.data!));
              });
    }



}