import 'dart:convert';

import 'package:get/route_manager.dart';
import 'package:vroom_driver/Components/snackBar.dart';
import 'package:http/http.dart' as http;
import 'package:vroom_driver/Others/Quotation/quotationSucess.dart';
import 'package:vroom_driver/apis/hiveStorage.dart';

import 'authCall.dart';

requestLoan(amount) async {
  try {
    String token = await HiveCalls().getUserToken();
    var response = await http.post(Uri.parse("$baseUrl/takeLoan"), headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
    }, body: {
      'amount': amount
    });
    if (response.statusCode == 201) {
      Get.to(()=>QuotstionSucess());
    } else if (response.statusCode == 401) {
      showCustomSnackBar(jsonDecode(response.body)['message']);
    } else
      showCustomSnackBar('Error requesting loan');
    print(response.body);
    print(response.statusCode);
  } on Exception catch (e) {
    print(e);
  }
}
payLoan(amount) async {
  try {
    String token = await HiveCalls().getUserToken();
    var response = await http.post(Uri.parse("$baseUrl/loanPayback"), headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
    }, body: {
      'amount': amount
    });
    if (response.statusCode == 201) {
      Get.to(()=>QuotstionSucess(sucesstext: "payment sucessful",));
    } else if (response.statusCode == 401) {
      showCustomSnackBar(jsonDecode(response.body)['message']);
    } else
      showCustomSnackBar('Error requesting loan');
    print(response.body);
    print(response.statusCode);
  } on Exception catch (e) {
    print(e);
  }
}
