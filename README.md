
# flutter_local_prefs [![pub package](https://img.shields.io/pub/v/flutter_local_prefs.svg)](https://pub.dev/packages/flutter_local_prefs)

This Flutter plugin allows you to securely store, retrieve, and manage local preferences, including strings, integers, booleans, and more, across both Android and iOS platforms. All preferences are encrypted to ensure data protection and privacy on the device.

# Pre-Requisites

### Android
Ensure your `minSdkVersion` is set to 19 or higher in your `android/app/build.gradle`:
```
minSdkVersion 19
```

### iOS
Minimum supported iOS version is 12.0. Ensure this is set in your iOS project configuration.

# Get Started

### Installation
Add the dependency to your `pubspec.yaml`.
```yaml
dependencies:
  flutter_local_prefs: ^0.0.1
```

### Import
```dart
import 'package:flutter_local_prefs/flutter_local_prefs.dart';
```

# Usage

Below are usage examples :

Initialize FlutterLocalPrefs instance
```dart
// Initialize instance
FlutterLocalPrefs flutterLocalPrefs = FlutterLocalPrefs();
```

Save and Retrieve String Example

```dart
// Save data
await flutterLocalPrefs.saveData(object: "objects", key: "test");
// Retrieve string data
String key = await flutterLocalPrefs.getString(key: "test");
```
Save and Retrieve Integer Example

```dart
// Save integer data
await flutterLocalPrefs.saveData(object: 42, key: "testInt");
// Retrieve integer data
int intData = await flutterLocalPrefs.getInt(key: "testInt");
```
Save and Retrieve Boolean Example

```dart
// Save boolean data
await flutterLocalPrefs.saveData(object: true, key: "testBool");
// Retrieve boolean data
bool boolData = await flutterLocalPrefs.getBool(key: "testBool");
```
Save and Retrieve Double Example

```dart
// Save double data
await flutterLocalPrefs.saveData(object: 3.14, key: "testDouble");
// Retrieve double data
double doubleData = await flutterLocalPrefs.getDouble(key: "testDouble");
```
Remove Data Example

```dart
// Remove specific key-value pair
await flutterLocalPrefs.remove(key: "testString");
// Remove all stored preferences
await flutterLocalPrefs.removeAll();
```
Check if a Key Exists Example

```dart
// Check if data exists for the key
bool exists = await flutterLocalPrefs.contain(key: "testString");
```



### Detailed Functions:
- **saveData**: Saves an object (String, int, bool, etc.) under a specific key.
- **getInt / getString / getBool / getDouble / getLong**: Retrieve data of the specified type.
- **remove**: Deletes the data stored with the specified key.
- **removeAll**: Deletes all stored data.
- **contain**: Checks if data with the specified key exists.

For a full API reference, please visit the official documentation.
