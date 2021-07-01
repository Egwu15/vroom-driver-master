import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VerificationSucessPage extends StatelessWidget {
  const VerificationSucessPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                child: Icon(
              Icons.done,
              color: Colors.white,
            ),backgroundColor: Colors.black,),
            SizedBox(
              height: 30,
            ),
            Text("Upload Sucessful!"),
            SizedBox(
              height: 10,
            ),
            Text("Verification will be processed."),
          ],
        ),
      ),
    );
  }
}
