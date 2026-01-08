import 'package:flutter_test/flutter_test.dart';
import 'package:shop/productjson.dart';

void main() {
  group('ProductModel', () {
    test(
      'Given valid product json '
      'When ProductModel.fromJson is called '
      'Then it should parse correctly',
      () {
        // Arrange
        final json = {
          "id": "0",
          "title": "Addidas Shoes ",
          "price": 44.42,
          "company": "Addidas",
          "sizes": [7, 8, 9, 10],
          "imageUrl": "assets/images/Addidas.jpeg",
        };

        // Act
        final product = ProductModel.fromJson(json);

        // Assert
        expect(product.id, "0");
        expect(product.title, "Addidas Shoes ");
        expect(product.price, 44.42);
        expect(product.company, "Addidas");
        expect(product.sizes, [7, 8, 9, 10]);
        expect(product.imageUrl, "assets/images/Addidas.jpeg");
      },
    );

    test(
      'Given ProductModel '
      'When toJson is called '
      'Then it should convert to correct map',
      () {
        // Arrange
        final product = ProductModel(
          id: "1",
          title: "BATA Shoes ",
          price: 20.42,
          company: "bata",
          sizes: [7, 8, 9, 10],
          imageUrl: "assets/images/bata.jpeg",
        );

        // Act
        final json = ProductModel.toJson(product);

        // Assert
        expect(json, {
          "id": "1",
          "title": "BATA Shoes ",
          "price": 20.42,
          "company": "bata",
          "sizes": [7, 8, 9, 10],
          "imageUrl": "assets/images/bata.jpeg",
        });
      },
    );
  });

  group('CartModel', () {
    test(
      'Given valid cart json '
      'When CartModel.fromJson is called '
      'Then it should parse correctly',
      () {
        // Arrange
        final json = {
          "id": "2",
          "title": "Nike Shoes ",
          "price": 33.42,
          "company": "Nike",
          "size": 8,
          "imageUrl": "assets/images/Nike.png",
        };

        // Act
        final cart = CartModel.fromJson(json);

        // Assert
        expect(cart.id, "2");
        expect(cart.title, "Nike Shoes ");
        expect(cart.price, 33.42);
        expect(cart.company, "Nike");
        expect(cart.size, 8);
        expect(cart.imageUrl, "assets/images/Nike.png");
      },
    );

    test(
      'Given CartModel '
      'When toJson is called '
      'Then it should convert to correct map',
      () {
        // Arrange
        final cart = CartModel(
          id: "2",
          title: "Nike Shoes ",
          price: 33.42,
          company: "Nike",
          size: 8,
          imageUrl: "assets/images/Nike.png",
        );

        // Act
        final json = CartModel.toJson(cart);

        // Assert
        expect(json, {
          "id": "2",
          "title": "Nike Shoes ",
          "price": 33.42,
          "company": "Nike",
          "size": 8,
          "imageUrl": "assets/images/Nike.png",
        });
      },
    );
  });

  group('Products list', () {
    test(
      'Given products list '
      'Then it should contain valid product maps',
      () {
        // Assert
        expect(products.isNotEmpty, true);
        expect(products.length, 3);

        for (final product in products) {
          expect(product.containsKey('id'), true);
          expect(product.containsKey('title'), true);
          expect(product.containsKey('price'), true);
          expect(product.containsKey('company'), true);
          expect(product.containsKey('sizes'), true);
          expect(product.containsKey('imageUrl'), true);
        }
      },
    );
  });
}
