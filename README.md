# chapter_3_advanced_flutter

## 3.1 connectivity_plus package

<img src="https://github.com/Jaydeepsharma93/chapter_3_advanced_flutter/assets/143181361/bd275972-1e71-43bf-8713-0de0abb4489c" width = 32%>
<img src="https://github.com/Jaydeepsharma93/chapter_3_advanced_flutter/assets/143181361/d684cdd0-eb02-4eb9-bc2e-62abf5268bc1" width = 32%>
<div><video src="https://github.com/Jaydeepsharma93/chapter_3_advanced_flutter/assets/143181361/5e7485e5-c7c8-4c08-8ef9-0630d6d40794" width = 32%></div>

## connectivity_plus package :-

The connectivity_plus package in Flutter is a plugin that provides functionality to detect the type of network connection (WiFi, cellular data, etc.) currently available on the device.

Purpose :
   * Helps your Flutter app understand the network environment (WiFi, mobile data, or no connection).
   * Enables you to adapt your app's behavior based on the available network type.

Benefits :
   * Improved User Experience: You can display informative messages, disable features, or adjust content based on network availability (e.g., display cached content offline).
   * Simplified Development: Provides a platform-agnostic way to check network connectivity, saving you from writing separate code for Android and iOS.
```dart
import 'package:connectivity_plus/connectivity_plus.dart';

final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();

// This condition is for demo purposes only to explain every connection type.
if (connectivityResult.contains(ConnectivityResult.wifi)) {
  print("Device is connected to WiFi.");
} else if (connectivityResult.contains(ConnectivityResult.mobile)) {
  print("Device is connected to cellular data.");
} else {
  print("No active network connection.");
}
```

## 3.2 Chrome : flutter_inappwebview Package

<img src="https://github.com/Jaydeepsharma93/chapter_3_advanced_flutter/assets/143181361/dabed125-e5ed-4e5d-9cad-6c317eb49227" width = 32%>
<img src="https://github.com/Jaydeepsharma93/chapter_3_advanced_flutter/assets/143181361/861f54c7-c24a-45bd-b4d5-3c4037d354a6" width = 32%>
