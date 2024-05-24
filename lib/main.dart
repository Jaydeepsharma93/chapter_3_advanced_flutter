import 'package:chapter_3_advanced_flutter/3.1%20connectivity_plus%20package/connectivity.dart';
import 'package:chapter_3_advanced_flutter/3.2%20Chrome%20flutter_inappwebview%20Package/provider/provier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '3.2 Chrome flutter_inappwebview Package/chromeview.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider(create: (context) => WebProvider(),)
  ],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/chrome',
      routes: {
        // '/': (context) => const ConnectivityCheck(),
        '/chrome' : (context) => const ChromeView()
      },
    );
  }
}
