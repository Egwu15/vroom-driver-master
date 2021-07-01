import 'dart:convert';

import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:vroom_driver/Auth/confirmPassword.dart';
import 'package:vroom_driver/Auth/loginPage.dart';
import 'package:vroom_driver/Components/snackBar.dart';
import 'package:vroom_driver/Others/Quotation/quotationSucess.dart';
import 'package:vroom_driver/apis/hiveStorage.dart';
import 'authCall.dart';

withdraw(amount) async {
  String token = await HiveCalls().getUserToken();
  try {
    var response = await http.post(
      Uri.parse("$baseUrl/makeTransfer"),
      headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    print(response.statusCode);
    String recipient =
        jsonDecode(response.body)['data']['data']["recipient_code"];
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['data']['status']) {
      print(amount);
      var response = await http.post(Uri.parse("$baseUrl/sendMoney"), headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token',
      }, body: {
        'amount': amount,
        'recipient': recipient
      });
      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        Get.to(() => QuotstionSucess(
              sucesstext: "payment will be sent shortly",
            ));
      }
    } else {
      showCustomSnackBar('Error! check if user is verified!');
    }
    print(response.body);
    print(response.statusCode);
  } on Exception catch (e) {
    print(e);
  }
}
