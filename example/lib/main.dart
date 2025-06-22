// In shoppable_feed/example/lib/main.dart

import 'dart:developer';

import 'package:flutter/material.dart';
// This import will now work because of the path dependency
import 'package:shoppable_feed/shoppable_feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shoppable Feed Example',
      debugShowCheckedModeBanner: false,
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  // --- Mock Data ---
  final List<ProductModel> _products = const [
    ProductModel(
      id: '1',
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
      productName: 'Vibrant Red Runner',
      sellerName: 'Nike Flagship Store',
      brandLogoUrl:
          'https://i.pinimg.com/originals/de/a4/c9/dea4c9353599e15f67aa814f33148443.png',
      price: '\$160.00',
      rating: 4.8,
      ratingCount: 18270,
      reviewCount: 4567,
      isOfficialStore: true,
    ),
    ProductModel(
      id: '2',
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
      productName: 'Classic Chronograph Watch',
      sellerName: 'Timeless Watches Co.',
      brandLogoUrl:
          'https://i.pinimg.com/originals/c1/9f/12/c19f12e4f526b38c2278792036495689.png',
      price: '\$250.00',
      rating: 4.6,
      ratingCount: 25340,
      reviewCount: 8123,
    ),
    ProductModel(
      id: '3',
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
      productName: 'Pro Audio Headphones',
      sellerName: 'SoundWave Audio',
      brandLogoUrl:
          'https://cdn.dribbble.com/users/423687/screenshots/14299824/media/649d2906511a768c7e873a0a1945653d.png?compress=1&resize=400x300',
      price: '\$199.00',
      rating: 4.9,
      ratingCount: 45890,
      reviewCount: 11234,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShoppableFeed(
        products: _products,
        initialWatchedProductIds: const ['3'],
        onAddToCart: (product) {
          log('Add to cart tapped for: ${product.productName}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${product.productName} added to cart!'),
              backgroundColor: Colors.green,
            ),
          );
        },
        onToggleWatch: (product) {
          log('Watch toggled for: ${product.productName}');
        },
        onShare: (product) {
          log('Share tapped for: ${product.productName}');
        },
        onShowReviews: (product) {
          log('Show reviews tapped for: ${product.productName}');
          showModalBottomSheet(
            context: context,
            builder:
                (c) => Center(
                  child: Text('Showing reviews for ${product.productName}'),
                ),
          );
        },
        onFollow: (product) {
          log('Follow tapped for seller: ${product.sellerName}');
        },
      ),
    );
  }
}
