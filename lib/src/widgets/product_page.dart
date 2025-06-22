// In lib/src/widgets/product_page.dart

import 'package:flutter/material.dart';
import '../models/product_model.dart';

// This is the internal widget for a single page.
class ProductPage extends StatefulWidget {
  final ProductModel product;
  final bool isWatched;
  final VoidCallback onToggleWatch;
  final ValueChanged<ProductModel> onAddToCart;
  final VoidCallback onShare;
  final VoidCallback onShowReviews;
  final VoidCallback onFollow;

  const ProductPage({
    super.key,
    required this.product,
    required this.isWatched,
    required this.onToggleWatch,
    required this.onAddToCart,
    required this.onShare,
    required this.onShowReviews,
    required this.onFollow,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          widget.product.imageUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
        ),
        _buildUiOverlay(),
      ],
    );
  }

  // All the UI building logic from before, but now using the callbacks.
  Widget _buildUiOverlay() {
    return Column(
      children: [
        _buildTopBar(),
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: _buildBottomInfoPanel()),
            _buildSideActionButtons(),
          ],
        ),
      ],
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 10),
      color: Colors.black.withValues(alpha: 0.3),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.product.brandLogoUrl),
            radius: 20,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.sellerName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.product.isOfficialStore)
                const Text(
                  'Official Store',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
            ],
          ),
          const Spacer(),
          OutlinedButton(
            onPressed: widget.onFollow, // Use callback
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            child: const Text('Follow'),
          ),
        ],
      ),
    );
  }

  Widget _buildSideActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, bottom: 80),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ActionButton(
            icon: widget.isWatched ? Icons.bookmark : Icons.bookmark_border,
            label: 'Watch',
            onTap: widget.onToggleWatch, // Use callback
            iconColor: widget.isWatched ? Colors.yellowAccent : Colors.white,
          ),
          const SizedBox(height: 25),
          _ActionButton(
            icon: Icons.reviews_outlined,
            label: widget.product.reviewCount.toString(),
            onTap: widget.onShowReviews, // Use callback
          ),
          const SizedBox(height: 25),
          _ActionButton(
            icon: Icons.share,
            label: 'Share',
            onTap: widget.onShare, // Use callback
          ),
        ],
      ),
    );
  }

  Widget _buildBottomInfoPanel() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black.withValues(alpha: .8), Colors.transparent],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.productName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                widget.product.rating.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              _buildStarRating(widget.product.rating),
              const SizedBox(width: 8),
              Text(
                '(${widget.product.ratingCount} Ratings)',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            widget.product.price,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:
                  () => widget.onAddToCart(widget.product), // Use callback
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF57224),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating(double rating) {
    // ... star rating logic from before
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      IconData icon;
      if (i <= rating) {
        icon = Icons.star_rounded;
      } else if (i > rating && i < rating + 1) {
        icon = Icons.star_half_rounded;
      } else {
        icon = Icons.star_outline_rounded;
      }
      stars.add(Icon(icon, color: Colors.amber, size: 18));
    }
    return Row(children: stars);
  }
}

class _ActionButton extends StatelessWidget {
  // ... _ActionButton code from before
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color iconColor;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32, color: iconColor),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
