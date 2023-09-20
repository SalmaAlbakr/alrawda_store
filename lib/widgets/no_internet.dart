import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Row(
            children: [
              Icon(Icons.signal_wifi_connected_no_internet_4_rounded),
              Text("no internet plz check",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              )),
            ],
          ),
        ),
      ),
    );
  }
}