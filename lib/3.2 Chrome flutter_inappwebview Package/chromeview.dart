import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

TextEditingController txtSearchedText = TextEditingController();

class ChromeView extends StatelessWidget {
  const ChromeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              if (snapshot.data!.contains(ConnectivityResult.mobile) ||
                  snapshot.data!.contains(ConnectivityResult.wifi)) {
                return InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: WebUri('https://www.google.com/search?q=shopify&rlz=1C1RXQR_enIN1094IN1094&oq=&gs_lcrp=EgZjaHJvbWUqCQgBEEUYOxjCAzIJCAAQRRg7GMIDMgkIARBFGDsYwgMyCQgCEEUYOxjCAzIJCAMQRRg7GMIDMgkIBBBFGDsYwgMyCQgFEEUYOxjCAzIJCAYQRRg7GMIDMgkIBxBFGDsYwgPSAQoxNzY1MDdqMGo3qAIIsAIB&sourceid=chrome&ie=UTF-8'),
                  ),
                );
              } else {
                return Center(
                  child: Image.asset("assets/img/gif.gif"),
                );
              }
            }));
  }
}
