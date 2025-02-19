# flutter_local_prefs [![pub package](https://img.shields.io/pub/v/flutter_local_prefs.svg)](https://pub.dev/packages/flutter_local_prefs)

**flutter_local_prefs** is a Flutter plugin that allows you to securely store, retrieve, and manage local preferences across both **Android** and **iOS** platforms. With this package, you can maintain **two categories** of data:

1. **Persistent Data** (`isPersistent: true`) – remains even after logout or app restarts.
2. **Non-Persistent Data** (`isPersistent: false`) – cleared when you decide (e.g., during logout).

All stored preferences are **encrypted**, ensuring data protection and privacy.

---

## 📌 Why Use Persistent and Non-Persistent Data?
Sometimes you may want **certain preferences** (e.g., user settings) to remain even after logout, but clear **others** (e.g., user session tokens). By separating your data into **persistent** and **non-persistent**, you can easily control which data to keep or remove.

---

## 📢 Pre-Requisites

### Android
Ensure your `minSdkVersion` is set to `19` or higher in your `android/app/build.gradle`:
```gradle
minSdkVersion 19
```

### iOS
Ensure the minimum supported iOS version is **12.0** in your project configuration.

---

## 🚀 Installation
Add the dependency to your `pubspec.yaml`:
```yaml
dependencies:
  flutter_local_prefs: ^0.0.4
```

Then import the package:
```dart
import 'package:flutter_local_prefs/flutter_local_prefs.dart';
```

---

## 💾 Storing Data

### Persistent Data (e.g., keep after logout)
```dart
// Create an instance
FlutterLocalPrefs flutterLocalPrefs = FlutterLocalPrefs();

// Save a persistent string
await flutterLocalPrefs.saveData(
  object: "Welcome!",
  key: "welcomeMessage",
  isPersistent: true,
);

// Save a persistent boolean
await flutterLocalPrefs.saveData(
  object: true,
  key: "darkModeEnabled",
  isPersistent: true,
);
```

### Non-Persistent Data (e.g., clear on logout)
```dart
// Save a non-persistent (temporary) token
await flutterLocalPrefs.saveData(
  object: "ABC123",
  key: "sessionToken",
  isPersistent: false,
);
```

---

## 📥 Retrieving Data

```dart
// Retrieve persistent data
String message = await flutterLocalPrefs.getString(
  key: "welcomeMessage",
  isPersistent: true,
);

bool darkMode = await flutterLocalPrefs.getBool(
  key: "darkModeEnabled",
  isPersistent: true,
);

// Retrieve non-persistent data
String sessionToken = await flutterLocalPrefs.getString(
  key: "sessionToken",
  isPersistent: false,
);
```

---

## 🗑 Removing Data

### Remove Non-Persistent Data During Logout
If you only want to clear **non-persistent** data at logout (like session info), use:
```dart
await flutterLocalPrefs.removeAll(
  isPersistent: false,
);
```
This **removes all** data that was saved with `isPersistent: false`, while **keeping** data marked `isPersistent: true`.

### Remove Persistent Data
If you also want to remove everything that was saved as **persistent**, call:
```dart
await flutterLocalPrefs.removeAll(
  isPersistent: true,
);
```
This clears **all** data with `isPersistent: true`.

### Remove Specific Key
```dart
// Remove a single persistent key
await flutterLocalPrefs.remove(
  key: "darkModeEnabled",
  isPersistent: true,
);

// Remove a single non-persistent key
await flutterLocalPrefs.remove(
  key: "sessionToken",
  isPersistent: false,
);
```

---

## ❓ Check if Key Exists
```dart
bool isDarkModeExists = await flutterLocalPrefs.contain(
  key: "darkModeEnabled",
  isPersistent: true,
);

bool hasSessionToken = await flutterLocalPrefs.contain(
  key: "sessionToken",
  isPersistent: false,
);
```

---

## 📚 API Reference

| Method                                                                       | Description                                                                                                                |
| --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `saveData({required Object object, required String key, bool isPersistent})` | Saves an object (`String`, `int`, `bool`, `double`, `long`) under a specific key. Set `isPersistent: true` for permanent. |
| `getInt({required String key, bool isPersistent})`                           | Retrieves an integer value. Use `isPersistent: true` for persistent data.                                                 |
| `getString({required String key, bool isPersistent})`                        | Retrieves a string value.                                                                                                 |
| `getBool({required String key, bool isPersistent})`                          | Retrieves a boolean value.                                                                                                |
| `getDouble({required String key, bool isPersistent})`                        | Retrieves a double value.                                                                                                 |
| `getLong({required String key, bool isPersistent})`                          | Retrieves a long integer value.                                                                                           |
| `contain({required String key, bool isPersistent})`                          | Checks if a key exists in persistent or non-persistent storage.                                                           |
| `remove({required String key, bool isPersistent})`                           | Removes a specific key-value pair from persistent or non-persistent storage.                                              |
| `removeAll({bool isPersistent})`                                             | Clears **all** data in either persistent or non-persistent storage.                                                       |

---

## 📌 Usage Example

A typical logout flow might:
1. **Remove all** non-persistent data (e.g., session tokens) so the user is effectively logged out.
2. **Keep** certain persistent preferences (e.g., user’s theme settings or saved language preference).

If you also want to wipe out **persistent** data, simply call `removeAll(isPersistent: true)`.

---

## 📜 License
This project is licensed under the **MIT License**.

For a full API reference, visit the [official documentation](https://pub.dev/packages/flutter_local_prefs).

