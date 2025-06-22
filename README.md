# Shoppable Feed

A vertically-swiping feed of products for Flutter, inspired by modern e-commerce apps like Daraz and AliExpress. It allows for a rich, engaging product discovery experience.

![GIF of the package in action]https://github.com/mehdinathani/shoppable_feed/blob/main/assets/demo.gif

## Features
- Infinite vertical scrolling
- Rich, customizable UI for product details
- Stateful action buttons (Add to Cart, Watchlist, etc.)
- Exposes callbacks for all user interactions

## Getting started
Add the dependency to your `pubspec.yaml`:
```yaml
dependencies:
  shoppable_feed: ^1.0.0
```

## Usage
Import the package and use the `ShoppableFeed` widget.

```dart
import 'package:shoppable_feed/shoppable_feed.dart';

// See the `example` tab for a full implementation.
ShoppableFeed(
    products: myListOfProducts,
    onAddToCart: (product) { ... },
    onToggleWatch: (product) { ... },
    // ... implement other callbacks
)
```