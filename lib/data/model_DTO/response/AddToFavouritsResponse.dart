import '../../../domain/entities/AddToFavouritsResponseEntity.dart';

/// status : "success"
/// message : "Product added successfully to your wishlist"
/// data : ["6428ebc6dc1175abc65ca0b9"]

class AddToFavouritsResponse extends AddToFavouritsResponseEntity {
  AddToFavouritsResponse({
      super.status,
    super.message,
    super.data,});

  AddToFavouritsResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

}