import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mr_azmi/view/components/customs/text_custom.dart';

class ConnectionAlert {
  static Future <void> checkConnectivity(BuildContext context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: TextCustom( text:'No Internet Connection'),
            content: TextCustom(text: 'Please check your internet connection', fontSize: 16),
            actions:[
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  foregroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
