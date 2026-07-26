import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newnop_flutter_assessment/features/products/providers/product_list_provider.dart';
import 'package:newnop_flutter_assessment/features/products/screens/product_list_screen.dart';
import 'package:newnop_flutter_assessment/features/products/widgets/product_card.dart';
import 'package:newnop_flutter_assessment/shared/models/product.dart';

void main() {
  const testProduct = Product(
    id: '1',
    name: 'Ergonomic Wooden Chair with Extra Long Description Name',
    category: 'Furniture & Living Room',
    price: 15990.0,
    imageUrl: 'https://example.com/image.jpg',
    description: 'A test product description.',
  );

  Widget buildTestCard({required double width, required double height, double textScale = 1.0}) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: width,
            height: height,
            child: MediaQuery(
              data: MediaQueryData(textScaler: TextScaler.linear(textScale)),
              child: ProductCard(
                product: testProduct,
                isFavourite: false,
                onTap: () {},
                onFavouriteToggle: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('ProductCard renders without overflow on standard phone card bounds (158x263)', (tester) async {
    await tester.pumpWidget(buildTestCard(width: 158, height: 263));
    expect(tester.takeException(), isNull);
    expect(find.text('Ergonomic Wooden Chair with Extra Long Description Name'), findsOneWidget);
    expect(find.text('LKR 15990.00'), findsOneWidget);
  });

  testWidgets('ProductCard renders without overflow on compact phone card bounds (138x246)', (tester) async {
    await tester.pumpWidget(buildTestCard(width: 138, height: 246));
    expect(tester.takeException(), isNull);
    expect(find.text('Ergonomic Wooden Chair with Extra Long Description Name'), findsOneWidget);
  });

  testWidgets('ProductCard handles enlarged text scale factor without overflow', (tester) async {
    await tester.pumpWidget(buildTestCard(width: 158, height: 270, textScale: 1.3));
    expect(tester.takeException(), isNull);
  });

  testWidgets('ProductListScreen grid layout renders without overflow on mobile screen (360x640)', (tester) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          filteredProductsProvider.overrideWith((ref) => AsyncData([testProduct, testProduct])),
        ],
        child: const MaterialApp(
          home: ProductListScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
