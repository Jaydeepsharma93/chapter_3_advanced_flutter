import 'package:chapter_3_advanced_flutter/3.2%20Chrome%20flutter_inappwebview%20Package/provider/provier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

TextEditingController txtsearch = TextEditingController();
late InAppWebViewController inAppWebViewController;

class ChromeView extends StatelessWidget {
  const ChromeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: txtsearch,
              decoration: InputDecoration(
                  prefixIcon: Spacer(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        Provider.of<WebProvider>(context, listen: false)
                            .search(txtsearch.text);

                        inAppWebViewController.loadUrl(
                            urlRequest: URLRequest(
                                url: WebUri(
                                    'https://www.google.com/search?q=${Provider.of<WebProvider>(context, listen: false).searchtext}  &sca_esv=2358ec6357e7f4b8&sca_upv=1&sxsrf=ADLYWIIskdPoVtrMe3x9OTJOiDDBhSiqKA%3A1716531975549&ei=BzNQZsqGIcfd2roPxumH2AE&oq=flutter+a&gs_lp=Egxnd3Mtd2l6LXNlcnAiCWZsdXR0ZXIgYSoCCAEyCxAAGIAEGJECGIoFMg4QABiABBiRAhixAxiKBTILEAAYgAQYsQMYgwEyDRAAGIAEGLEDGBQYhwIyCxAAGIAEGJECGIoFMgsQABiABBixAxiDATIOEAAYgAQYkQIYsQMYigUyCxAAGIAEGJECGIoFMgUQABiABDIFEAAYgARIni9QqAlY1hxwAXgBkAEAmAHMAaAB3QKqAQUwLjEuMbgBA8gBAPgBAZgCA6AC6gLCAgcQIxiwAxgnwgIKEAAYsAMY1gQYR8ICBBAjGCfCAgoQIxiABBgnGIoFwgIIEAAYgAQYsQOYAwCIBgGQBgqSBwUxLjEuMaAHyw4&sclient=gws-wiz-serp')));
                      },
                      icon: Icon(Icons.search)),
                  hintText: 'Search or type URL',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  contentPadding: EdgeInsets.symmetric(vertical: 10)),
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.data!.contains(ConnectivityResult.mobile) ||
              snapshot.data!.contains(ConnectivityResult.wifi)) {
            return Stack(
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: WebUri(
                        'https://www.google.com/search?q= ${Provider.of<WebProvider>(context, listen: false).searchtext} &sca_esv=2358ec6357e7f4b8&sca_upv=1&sxsrf=ADLYWIIskdPoVtrMe3x9OTJOiDDBhSiqKA%3A1716531975549&ei=BzNQZsqGIcfd2roPxumH2AE&oq=flutter+a&gs_lp=Egxnd3Mtd2l6LXNlcnAiCWZsdXR0ZXIgYSoCCAEyCxAAGIAEGJECGIoFMg4QABiABBiRAhixAxiKBTILEAAYgAQYsQMYgwEyDRAAGIAEGLEDGBQYhwIyCxAAGIAEGJECGIoFMgsQABiABBixAxiDATIOEAAYgAQYkQIYsQMYigUyCxAAGIAEGJECGIoFMgUQABiABDIFEAAYgARIni9QqAlY1hxwAXgBkAEAmAHMAaAB3QKqAQUwLjEuMbgBA8gBAPgBAZgCA6AC6gLCAgcQIxiwAxgnwgIKEAAYsAMY1gQYR8ICBBAjGCfCAgoQIxiABBgnGIoFwgIIEAAYgAQYsQOYAwCIBgGQBgqSBwUxLjEuMaAHyw4&sclient=gws-wiz-serp'),
                  ),
                  onWebViewCreated: (controller) {
                    inAppWebViewController = controller;
                  },
                  onProgressChanged: (controller, progress) {
                    Provider.of<WebProvider>(context, listen: false)
                        .onchange_progress(progress);
                  },
                ),
                (Provider.of<WebProvider>(context, listen: true).progress < 1)
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: LinearProgressIndicator(
                          color: Colors.blue,
                          value: Provider.of<WebProvider>(context, listen: true)
                              .progress,
                        ))
                    : Container()
              ],
            );
          } else {
            return Center(
              child: Image.asset("assets/img/gif.gif"),
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {
              inAppWebViewController.goBack();
            }, icon: Icon(Icons.arrow_back_ios_new)),
            IconButton(onPressed: () {
              inAppWebViewController.goForward();
            }, icon: Icon(Icons.arrow_forward_ios)),
            IconButton(onPressed: () {
              inAppWebViewController.reload();
            }, icon: Icon(Icons.refresh)),
            IconButton(onPressed: () {}, icon: Icon(Icons.looks_one_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.menu))
          ],
        ),
      ),
    );
  }
}
