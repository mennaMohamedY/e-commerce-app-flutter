import 'package:e_commerce_app/domain/entities/AddToCartResponseEntity.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 2
/// data : {"_id":"660a2ac2be8b523235a6ce1a","cartOwner":"65cb2cc08462ab02c71e68ca","products":[{"count":11,"_id":"660a2ac2be8b523235a6ce1b","product":"6428ebc6dc1175abc65ca0b9","price":160},{"count":0,"_id":"660bc073be8b523235a8ca5d","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2024-04-01T03:32:18.855Z","updatedAt":"2024-04-13T00:35:01.199Z","__v":2,"totalCartPrice":1760}

class AddToCartResponse extends AddToCartResponseEntity{
  AddToCartResponse({
    super.status,
    super.message,
    super.numOfCartItems,
    super.data,
    this.statusMsg,
  });

  AddToCartResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? CartData.fromJson(json['data']) : null;
  }
  String? statusMsg;



}

/// _id : "660a2ac2be8b523235a6ce1a"
/// cartOwner : "65cb2cc08462ab02c71e68ca"
/// products : [{"count":11,"_id":"660a2ac2be8b523235a6ce1b","product":"6428ebc6dc1175abc65ca0b9","price":160},{"count":0,"_id":"660bc073be8b523235a8ca5d","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2024-04-01T03:32:18.855Z"
/// updatedAt : "2024-04-13T00:35:01.199Z"
/// __v : 2
/// totalCartPrice : 1760

class CartData extends CartDataEntity {
  CartData({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,});

  CartData.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }




}

/// count : 11
/// _id : "660a2ac2be8b523235a6ce1b"
/// product : "6428ebc6dc1175abc65ca0b9"
/// price : 160

class Products extends CartProductsEntity{
  Products({
      super.count,
    super.id,
    super.product,
    super.price,});

  Products.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }

}