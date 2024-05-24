import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityCheck extends StatelessWidget {
  const ConnectivityCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream:Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              if (snapshot.data!.contains(ConnectivityResult.mobile)||snapshot.data!.contains(ConnectivityResult.wifi)) {
                return Center(
                  child:Image.asset("assets/img/online.gif") ,
                );
              }
              else {
                return Center(
                  child: Image.asset("assets/img/gif.gif"),
                );
              }
            }
        )
    );
  }
}