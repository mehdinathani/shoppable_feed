# 🛍️ Shoppable Feed – Modern Product Discovery for Flutter

A **vertically swiping, full-screen product feed** widget for Flutter — inspired by top e-commerce apps like **Daraz**, **AliExpress**, and **TikTok Shop**. Designed for high-impact visual discovery experiences that **drive engagement** and **boost conversions**.

> ⚡ Built from scratch using core Flutter widgets – no third-party UI dependencies.

![Shoppable Feed Demo](screenshots/demo.gif) 
(https://raw.githubusercontent.com/mehdinathani/shoppable_feed/refs/heads/main/assets/demo.gif)

---

## 🚀 Features

- 🔄 Infinite vertical scrolling (`PageView`)
- 🖼️ Dynamic layout with:
  - Product images
  - Brand logo and seller name
  - Star ratings, price, and review count
- 🛒 Interactive buttons:
  - **Add to Cart**
  - **Watchlist toggle**
  - **Follow Seller**
  - **Show Reviews / Share**
- 📦 Clean `ProductModel` for easy integration
- 🔧 Full control via callbacks (`onAddToCart`, `onToggleWatch`, etc.)
- ✅ 100% customizable and state-aware UI
- 📱 Perfect for shopping, deals, video commerce, and discovery apps

---

## 🧑‍💻 Getting Started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  shoppable_feed: ^1.0.0
```

Import the widget:

```dart
import 'package:shoppable_feed/shoppable_feed.dart';

ShoppableFeed(
  products: myListOfProducts,
  onAddToCart: (product) => print("Added ${product.name}"),
  onToggleWatch: (product) => print("Watch toggled: ${product.id}"),
  onShowReviews: (product) => showDialog(...),
  // more callbacks...
)
```

> 📲 Check out the full `example` app in this repo for a working demo.

---

## 📦 Data Model

Define your product using `ProductModel`:

```dart
ProductModel(
  id: '001',
  imageUrl: 'https://example.com/image.png',
  brandLogoUrl: 'https://example.com/brand.png',
  sellerName: 'Official Store',
  productName: 'Wireless Mouse',
  price: 2999,
  rating: 4.5,
  ratingCount: 120,
  isFollowing: false,
  isWatchlisted: false,
)
```

---

## 💡 Why Use Shoppable Feed?

- ⚡ **Gen Z–ready UI**: Fullscreen, swipe-native layout
- 💼 **Made for builders**: Clean code, no bloat
- 🧩 **Easily embeddable** in e-commerce, affiliate, or product showcase apps
- 🛠️ **Extensible**: Plug in your own data sources or Firestore integration

---

## 👨‍💻 About the Creator

**Mehdi Abbas Nathani**  
🚀 Flutter & AI Enthusiast | 🎓 MBA in Finance | 💼 Fintech Professional  
📍 Building tech with business impact | 💡 Making developer tools for the future  

- 🌐 [Website](https://mehdinathani.github.io/)
- 🧠 [LinkedIn](https://www.linkedin.com/in/mehdinathani/)
- 💻 [GitHub](https://github.com/mehdinathani)
- 📬 mehdinathani1@gmail.com

---

## 📜 License

This project is licensed under the MIT License.

---

## 🤝 Contributions

Pull requests, issues, and ideas are welcome.  
If you find this package helpful, **give it a ⭐ on [pub.dev](https://pub.dev/packages/shoppable_feed)** and help others discover it.

---

> Made with 💙 in Flutter — for the next generation of builders.
