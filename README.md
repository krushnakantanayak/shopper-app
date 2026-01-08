# 🛒 Shopper App (Flutter)

A modern Flutter shopping application with product listing, product details, cart management, and complete test coverage.

---

## 📱 App Overview

The Shopper App allows users to:
- Browse shoes by brand
- View product details
- Select size and add items to cart
- Manage cart items (delete with confirmation)
- Enjoy a smooth and test-safe UI experience

The app is built using **Flutter**, **Provider** for state management, and includes **unit tests and widget tests** with high coverage.

---

## ✨ Features

- 🧾 Product listing with brand filters
- 🔍 Product details page with size selection
- 🛒 Cart management using Provider
- 🧹 Delete confirmation dialog
- 🖼️ Safe image loading with fallback UI
- 🧪 Unit & widget tests with coverage
- 📱 Responsive UI with SafeArea handling

---


---

## 🧠 State Management

- **Provider (ChangeNotifier)**
- Centralized `CartProvider` for add/remove operations
- Injected at root level in `main.dart`

---

## 🧪 Test Coverage (LCOV)

This project uses **LCOV** to generate and analyze test coverage reports for Flutter tests.

### Generate Coverage
<img width="1400" height="424" alt="Screenshot 2026-01-08 at 11 46 21 PM" src="https://github.com/user-attachments/assets/52ffb7dc-a4dd-4463-afc2-5c3e5a0a4cf6" />
Run the following command to execute tests with coverage enabled:


```bash
flutter test --coverage 
```

```bash
flutter test --coverage && genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## 📸 App Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/89d0f333-2ff6-4902-9434-a0d4fff7670e" width="22%" />
  <img src="https://github.com/user-attachments/assets/2c29b202-24dd-49b4-9875-8f292db72d7b" width="22%" />
  <img src="https://github.com/user-attachments/assets/b476bcf5-2f2a-4f9d-a50c-a27256cfa612" width="22%" />
  <img src="https://github.com/user-attachments/assets/4f47b65f-639e-4fe2-b302-3d66caf705b9" width="22%" />
</p>

## 🛠 Tech Stack

- Flutter & Dart
- Riverpod
- json_serializable
- LCOV
---

## ▶ Build APK

Build a release APK for the application:

```bash
flutter build apk
```

## 🚀 Getting Started

Clone the repository and set up the project:

```bash
git clone https://github.com/krushnakantanayak/shopper-app.git
cd shopper-app
flutter pub get
flutter run
```


