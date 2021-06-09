import 'package:flutter/material.dart';

class QuotstionSucess extends StatelessWidget {
  const QuotstionSucess({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.download_done_rounded, color: Colors.green, size: 35.0),
          SizedBox(
            height: 30.0,
          ),
          Center(child: Text('Quotation generated sucessfully')),
        ],
      ),
    );
  }
}
