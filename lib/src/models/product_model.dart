// In lib/src/models/product_model.dart

import 'package:flutter/foundation.dart';

/// Data model for a single product in the shoppable feed.
@immutable
class ProductModel {
  final String id;
  final String imageUrl;
  final String productName;
  final String sellerName;
  final String brandLogoUrl;
  final String price;
  final double rating;
  final int ratingCount;
  final int reviewCount;
  final bool isOfficialStore;

  const ProductModel({
    required this.id,
    required this.imageUrl,
    required this.productName,
    required this.sellerName,
    required this.brandLogoUrl,
    required this.price,
    required this.rating,
    required this.ratingCount,
    required this.reviewCount,
    this.isOfficialStore = false,
  });
}
