import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop/firstpage.dart';
import 'package:shop/productcard.dart';
import 'package:shop/productdetalspage.dart';

void main() {
  Widget createTestWidget() {
    return const MaterialApp(
      home: MyfirstPage(),
    );
  }

  testWidgets(
    'Given MyfirstPage '
    'When page loads '
    'Then filter chips should be visible',
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());

      // Assert
      expect(find.text('All'), findsOneWidget);
      expect(find.text('addidas'), findsOneWidget);
      expect(find.text('Nike'), findsOneWidget);
      expect(find.text('Bata'), findsOneWidget);
    },
  );

  testWidgets(
    'Given MyfirstPage '
    'When a filter chip is tapped '
    'Then it should update selected filter',
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());

      // Act
      await tester.tap(find.text('Nike'));
      await tester.pump();

      // Assert
      expect(find.text('Nike'), findsOneWidget);
    },
  );

  testWidgets(
    'Given MyfirstPage '
    'When a product card is tapped '
    'Then it should navigate to ProductDetailsPage',
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // 🔥 Find ProductCard (correct target)
      final productCardFinder = find.byType(ProductCard);
      expect(productCardFinder, findsWidgets);

      // Act: tap first product card
      await tester.tap(productCardFinder.first);
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(ProductDetailsPage), findsOneWidget);
    },
  );
}
