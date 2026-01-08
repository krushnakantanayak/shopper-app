import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop/productcard.dart';

void main() {
  testWidgets(
    'Given ProductCard '
    'When image asset fails to load '
    'Then errorBuilder icon should be shown',
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProductCard(
              title: 'Test Shoe',
              price: 99.99,
              image: 'assets/images/does_not_exist.png', // ❌ invalid image
              backgroundColor: Colors.white,
            ),
          ),
        ),
      );

      // Let image loading fail
      await tester.pumpAndSettle();

      // Assert: errorBuilder widget rendered
      expect(find.byIcon(Icons.image_not_supported), findsOneWidget);
    },
  );
}
