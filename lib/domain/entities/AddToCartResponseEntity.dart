/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 2
/// data : {"_id":"660a2ac2be8b523235a6ce1a","cartOwner":"65cb2cc08462ab02c71e68ca","products":[{"count":11,"_id":"660a2ac2be8b523235a6ce1b","product":"6428ebc6dc1175abc65ca0b9","price":160},{"count":0,"_id":"660bc073be8b523235a8ca5d","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2024-04-01T03:32:18.855Z","updatedAt":"2024-04-13T00:35:01.199Z","__v":2,"totalCartPrice":1760}

class AddToCartResponseEntity {
  AddToCartResponseEntity({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.data,});

  String? status;
  String? message;
  num? numOfCartItems;
  CartDataEntity? data;

}

/// _id : "660a2ac2be8b523235a6ce1a"
/// cartOwner : "65cb2cc08462ab02c71e68ca"
/// products : [{"count":11,"_id":"660a2ac2be8b523235a6ce1b","product":"6428ebc6dc1175abc65ca0b9","price":160},{"count":0,"_id":"660bc073be8b523235a8ca5d","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2024-04-01T03:32:18.855Z"
/// updatedAt : "2024-04-13T00:35:01.199Z"
/// __v : 2
/// totalCartPrice : 1760

class CartDataEntity {
  CartDataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<CartProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

}

/// count : 11
/// _id : "660a2ac2be8b523235a6ce1b"
/// product : "6428ebc6dc1175abc65ca0b9"
/// price : 160

class CartProductsEntity {
  CartProductsEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  num? count;
  String? id;
  String? product;
  num? price;

}