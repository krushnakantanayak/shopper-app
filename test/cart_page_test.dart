import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shop/cartpage.dart';
import 'package:shop/cartprovider.dart';
import 'package:shop/productjson.dart';

void main() {
  // ✅ Mock asset loading (VERY IMPORTANT)
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    ServicesBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('flutter/assets', (message) async {
      return ByteData(0);
    });
  });

  Widget createTestWidget(CartProvider provider) {
    return ChangeNotifierProvider<CartProvider>.value(
      value: provider,
      child: const MaterialApp(
        home: CartPage(),
      ),
    );
  }

  testWidgets(
    'Given CartPage '
    'When cart has items '
    'Then cart items should be displayed',
    (WidgetTester tester) async {
      // Arrange
      final cartProvider = CartProvider();
      cartProvider.addProduct(
        CartModel(
          id: '1',
          title: 'Nike Shoes',
          price: 33.42,
          company: 'Nike',
          size: 8,
          imageUrl: 'assets/images/Nike.png',
        ),
      );

      await tester.pumpWidget(createTestWidget(cartProvider));

      // Assert
      expect(find.text('Nike Shoes'), findsOneWidget);
      expect(find.text('Size: 8'), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);
    },
  );

  testWidgets(
    'Given CartPage '
    'When delete icon is tapped '
    'Then confirmation dialog should appear',
    (WidgetTester tester) async {
      final cartProvider = CartProvider();
      cartProvider.addProduct(
        CartModel(
          id: '1',
          title: 'Nike Shoes',
          price: 33.42,
          company: 'Nike',
          size: 8,
          imageUrl: 'assets/images/Nike.png',
        ),
      );

      await tester.pumpWidget(createTestWidget(cartProvider));

      // Act
      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Delete Product'), findsOneWidget);
      expect(
          find.text(
              'Are you sure you want to be delete product from the cart ?'),
          findsOneWidget);
      expect(find.text('yes'), findsOneWidget);
      expect(find.text('no'), findsOneWidget);
    },
  );

  testWidgets(
    'Given CartPage '
    'When delete dialog No is pressed '
    'Then item should not be removed',
    (WidgetTester tester) async {
      final cartProvider = CartProvider();
      cartProvider.addProduct(
        CartModel(
          id: '1',
          title: 'Nike Shoes',
          price: 33.42,
          company: 'Nike',
          size: 8,
          imageUrl: 'assets/images/Nike.png',
        ),
      );

      await tester.pumpWidget(createTestWidget(cartProvider));

      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();

      await tester.tap(find.text('no'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Nike Shoes'), findsOneWidget);
    },
  );

  testWidgets(
    'Given CartPage '
    'When delete dialog Yes is pressed '
    'Then item should be removed from cart',
    (WidgetTester tester) async {
      final cartProvider = CartProvider();
      cartProvider.addProduct(
        CartModel(
          id: '1',
          title: 'Nike Shoes',
          price: 33.42,
          company: 'Nike',
          size: 8,
          imageUrl: 'assets/images/Nike.png',
        ),
      );

      await tester.pumpWidget(createTestWidget(cartProvider));

      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();

      await tester.tap(find.text('yes'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Nike Shoes'), findsNothing);
    },
  );
}
