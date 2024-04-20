
import '../../../../domain/entities/GetFavouritsTabResponseEntity.dart';

class FavouritsTabStates {}

class FavouritsTabLoadingState extends FavouritsTabStates{}

class FavouritsTabSuccessState extends FavouritsTabStates{
  List<FavouritsDataEntity>? favouritItemsList;
  FavouritsTabSuccessState({required this.favouritItemsList});
}

class FavouritsTabFailureState extends FavouritsTabStates{
  String failureMsg;
  FavouritsTabFailureState({required this.failureMsg});
}

class ItemAddedToCartSuccessState extends FavouritsTabStates{
  String successMsg;
  ItemAddedToCartSuccessState({required this.successMsg});
}
class ItemAddedErrorState extends FavouritsTabStates{
  String errorMsg;
  ItemAddedErrorState({required this.errorMsg});
}
class ItemDeletedSuccessfullyState extends FavouritsTabStates{
  String successMsg;
  ItemDeletedSuccessfullyState({required this.successMsg});
}
class ItemDeletedErrorState extends FavouritsTabStates{
  String errorMsg;
  ItemDeletedErrorState({required this.errorMsg});
}
