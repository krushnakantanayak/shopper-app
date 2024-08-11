final products = [
  {
    "id": '0',
    "title": 'Addidas Shoes ',
    "price": 44.42,
    "company": "Addidas",
    "sizes": [7, 8, 9, 10],
    "imageUrl": 'assets/images/Addidas.jpeg',
  },
  {
    "id": '1',
    "title": 'BATA Shoes ',
    "price": 20.42,
    "company": "bata",
    "sizes": [7, 8, 9, 10],
    "imageUrl": 'assets/images/bata.jpeg',
  },
  {
    "id": '2',
    "title": ' Nike Shoes ',
    "price": 33.42,
    "company": "Nike",
    "sizes": [7, 8, 9, 10],
    "imageUrl": 'assets/images/Nike.png',
  },
];

// final cart = [
//   {
//     "id": '2',
//     "title": ' Nike Shoes ',
//     "price": 33.42,
//     "company": "Nike",
//     "size": 8,
//     "imageUrl": 'assets/images/Nike.png',
//   },
// ];

class CartModel {
  final String id;
  final String title;
  final double price;
  final String company;
  final int size;
  final String imageUrl;

  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.company,
    required this.size,
    required this.imageUrl,
  });

  static CartModel fromJson(Map<String, dynamic> cartModel) {
    return CartModel(
      id: cartModel['id'] as String,
      title: cartModel['title'] as String,
      price: cartModel['price'] as double,
      company: cartModel['company'] as String,
      size: cartModel['size'] as int,
      imageUrl: cartModel['imageUrl'] as String,
    );
  }

  static Map<String, dynamic> toJson(CartModel cartModel) {
    return {
      "id": cartModel.id,
      "title": cartModel.title,
      "price": cartModel.price,
      "company": cartModel.company,
      "size": cartModel.size,
      "imageUrl": cartModel.imageUrl,
    };
  }
}

class ProductModel {
  final String id;
  final String title;
  final double price;
  final String company;
  final List<int> sizes;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.company,
    required this.sizes,
    required this.imageUrl,
  });

  static ProductModel fromJson(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'] as String,
      title: data['title'] as String,
      price: data['price'] as double,
      company: data['company'] as String,
      sizes: data['sizes'] as List<int>,
      imageUrl: data['imageUrl'] as String,
    );
  }

  static Map<String, dynamic> toJson(ProductModel productModel) {
    return {
      "id": productModel.id,
      "title": productModel.title,
      "price": productModel.price,
      "company": productModel.company,
      "sizes": productModel.sizes,
      "imageUrl": productModel.imageUrl,
    };
  }
}
