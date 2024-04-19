import 'package:e_commerce_app/domain/entities/GetFavouritsTabResponseEntity.dart';

/// status : "success"
/// count : 3
/// data : [{"sold":4717,"images":["1680403397482-1.jpeg","1680403397482-2.jpeg","1680403397483-3.jpeg","1680403397485-4.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":18,"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen","quantity":225,"price":160,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:43:18.400Z","updatedAt":"2024-04-19T17:44:02.666Z","__v":0,"id":"6428ebc6dc1175abc65ca0b9"},{"sold":9328,"images":["1680403156555-3.jpeg","1680403156555-2.jpeg","1680403156554-1.jpeg","1680403156556-4.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":18,"_id":"6428ead5dc1175abc65ca0ad","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen","quantity":220,"price":149,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"createdAt":"2023-04-02T02:39:17.204Z","updatedAt":"2024-04-19T19:26:42.940Z","__v":0,"id":"6428ead5dc1175abc65ca0ad"},{"sold":2174,"images":["1680402296306-3.jpeg","1680402296305-1.jpeg","1680402296305-2.jpeg"],"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"ratingsQuantity":5,"_id":"6428e778dc1175abc65ca08a","title":"Woman Brown Long Sleeve Tunic LT.CAMEL","slug":"woman-brown-long-sleeve-tunic-lt.camel","description":"ShellFabric1 Cotton 65% Polyester 35%","quantity":229,"price":499,"priceAfterDiscount":359,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402295928-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.7,"createdAt":"2023-04-02T02:24:56.975Z","updatedAt":"2024-04-19T20:19:11.989Z","__v":0,"id":"6428e778dc1175abc65ca08a"}]

class GetFavouritsTabResponse extends GetFavouritsTabResponseEntity {
  GetFavouritsTabResponse({
      super.status,
    super.count,
    super.data,
    this.statusMsg,
    this.message});

  GetFavouritsTabResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(FavouritsData.fromJson(v));
      });
    }
  }
  String? statusMsg;
  String? message;
}

/// sold : 4717
/// images : ["1680403397482-1.jpeg","1680403397482-2.jpeg","1680403397483-3.jpeg","1680403397485-4.jpeg"]
/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// ratingsQuantity : 18
/// _id : "6428ebc6dc1175abc65ca0b9"
/// title : "Woman Shawl"
/// slug : "woman-shawl"
/// description : "Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen"
/// quantity : 225
/// price : 160
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8
/// createdAt : "2023-04-02T02:43:18.400Z"
/// updatedAt : "2024-04-19T17:44:02.666Z"
/// __v : 0
/// id : "6428ebc6dc1175abc65ca0b9"

class FavouritsData extends FavouritsDataEntity {
  FavouritsData({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
      });
  FavouritsData.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(FavouritsSubcategory.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? FavouritsCategory.fromJson(json['category']) : null;
    brand = json['brand'] != null ? FavouritsBrand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}

/// _id : "64089bbe24b25627a253158b"
/// name : "DeFacto"
/// slug : "defacto"
/// image : "https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"

class FavouritsBrand extends FavouritsBrandEntity{
  FavouritsBrand({
    super.id,
    super.name,
    super.slug,
    super.image,});

  FavouritsBrand.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

/// _id : "6439d58a0049ad0b52b9003f"
/// name : "Women's Fashion"
/// slug : "women's-fashion"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"

class FavouritsCategory extends FavouritsCategoryEntity{
  FavouritsCategory({
    super.id,
    super.name,
    super.slug,
    super.image,});

  FavouritsCategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

/// _id : "6407f1bcb575d3b90bf95797"
/// name : "Women's Clothing"
/// slug : "women's-clothing"
/// category : "6439d58a0049ad0b52b9003f"

class FavouritsSubcategory extends FavouritsSubcategoryEntity {
  FavouritsSubcategory({
    super.id,
    super.name,
    super.slug,
    super.category,});

  FavouritsSubcategory.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

}