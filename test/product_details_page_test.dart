import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shop/cartprovider.dart';
import 'package:shop/productdetalspage.dart';

void main() {
  // Dummy product data for testing
  final testProduct = {
    "id": "1",
    "title": "Nike Air",
    "price": 120.0,
    "company": "Nike",
    "sizes": [6, 7, 8],
    "imageUrl": "assets/images/shoe.png",
  };

  Widget createTestWidget() {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        home: ProductDetailsPage(product: testProduct),
      ),
    );
  }

  testWidgets(
    'Given ProductDetailsPage '
    'When page loads '
    'Then product title and price should be visible',
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());

      // Assert
      expect(find.text('Nike Air'), findsOneWidget);
      expect(find.text('\$120.0'), findsOneWidget);
      expect(find.text('Add to cart'), findsOneWidget);
    },
  );

  testWidgets(
    'Given ProductDetailsPage '
    'When Add to cart is pressed without selecting size '
    'Then error SnackBar should be shown',
    (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      // Act
      await tester.tap(find.text('Add to cart'));
      await tester.pump(); // show snackbar

      // Assert
      expect(find.text('Please select size'), findsOneWidget);
    },
  );

  testWidgets(
    'Given ProductDetailsPage '
    'When size is selected and Add to cart is pressed '
    'Then product should be added successfully',
    (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      // Select size "7"
      await tester.tap(find.text('7'));
      await tester.pump();

      // Tap add to cart
      await tester.tap(find.text('Add to cart'));
      await tester.pump();

      // Assert success snackbar
      expect(find.text('add sucessfully'), findsOneWidget);
    },
  );
}
