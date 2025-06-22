// In lib/shoppable_feed.dart

import 'package:flutter/material.dart';
import 'src/models/product_model.dart';
import 'src/widgets/product_page.dart';

// Re-export the model so users of the package can use it
export 'src/models/product_model.dart';

/// A vertically-swiping feed of products, inspired by modern e-commerce apps.
class ShoppableFeed extends StatefulWidget {
  /// The list of products to display.
  final List<ProductModel> products;

  /// A controller to programmatically control the page view.
  final PageController? controller;

  /// A list of product IDs that should initially be marked as "watched".
  final List<String> initialWatchedProductIds;

  // --- Callbacks ---
  /// Called when a user taps the "Add to Cart" button.
  final ValueChanged<ProductModel> onAddToCart;

  /// Called when a user toggles the watch status of a product.
  final ValueChanged<ProductModel> onToggleWatch;

  /// Called when a user taps the "Share" button.
  final ValueChanged<ProductModel> onShare;

  /// Called when a user taps the reviews button.
  final ValueChanged<ProductModel> onShowReviews;

  /// Called when a user taps the "Follow" button.
  final ValueChanged<ProductModel> onFollow;

  const ShoppableFeed({
    super.key,
    required this.products,
    required this.onAddToCart,
    required this.onToggleWatch,
    required this.onShare,
    required this.onShowReviews,
    required this.onFollow,
    this.controller,
    this.initialWatchedProductIds = const [],
  });

  @override
  State<ShoppableFeed> createState() => _ShoppableFeedState();
}

class _ShoppableFeedState extends State<ShoppableFeed> {
  late PageController _pageController;
  late Set<String> _watchedProductIds;

  @override
  void initState() {
    super.initState();
    _pageController = widget.controller ?? PageController(initialPage: 5000);
    _watchedProductIds = Set<String>.from(widget.initialWatchedProductIds);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      return const Center(child: Text('No products to display.'));
    }

    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final productIndex = index % widget.products.length;
        final product = widget.products[productIndex];

        return ProductPage(
          product: product,
          isWatched: _watchedProductIds.contains(product.id),
          onToggleWatch: () {
            setState(() {
              if (_watchedProductIds.contains(product.id)) {
                _watchedProductIds.remove(product.id);
              } else {
                _watchedProductIds.add(product.id);
              }
            });
            widget.onToggleWatch(product);
          },
          onAddToCart: widget.onAddToCart,
          onShare: () => widget.onShare(product),
          onShowReviews: () => widget.onShowReviews(product),
          onFollow: () => widget.onFollow(product),
        );
      },
    );
  }
}
