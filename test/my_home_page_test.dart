import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shop/cartpage.dart';
import 'package:shop/cartprovider.dart';
import 'package:shop/firstpage.dart';
import 'package:shop/homepage.dart';

void main() {
  Widget createTestWidget() {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }

  testWidgets(
    'Given MyHomePage '
    'When app loads '
    'Then MyfirstPage should be shown by default',
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());

      // Assert
      expect(find.byType(MyfirstPage), findsOneWidget);
      expect(find.byType(CartPage), findsNothing);
    },
  );

  testWidgets(
    'Given MyHomePage '
    'When BottomNavigationBar is shown '
    'Then it should have home and cart icons',
    (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
    },
  );

  testWidgets(
    'Given MyHomePage '
    'When cart icon is tapped '
    'Then CartPage should be displayed',
    (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      // Act
      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(CartPage), findsOneWidget);
      expect(find.byType(MyfirstPage), findsNothing);
    },
  );

  testWidgets(
    'Given MyHomePage '
    'When switching back to home '
    'Then MyfirstPage should be visible again',
    (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      // Go to cart
      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      // Back to home
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();

      expect(find.byType(MyfirstPage), findsOneWidget);
    },
  );
}
