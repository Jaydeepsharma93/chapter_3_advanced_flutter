import 'package:chapter_3_advanced_flutter/3.1%20connectivity_plus%20package/connectivity.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => ConnectivityCheck()
      },
    );
  }
}
