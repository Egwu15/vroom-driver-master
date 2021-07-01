import 'dart:convert';
import 'dart:io';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:vroom_driver/Others/Quotation/quotationSucess.dart';
import 'package:vroom_driver/Others/VerifyMyID/verificationSucess.dart';
import 'authCall.dart';
import '../Components/snackBar.dart';

 

uploadVerification(File rawFile, amount, bank) async {
  // String fileData = base64Encode(rawFile.readAsBytesSync());
  print(rawFile.uri);
  try {
    var token = await hiveCalls.getUserToken();
    print(token);
    var url = Uri.parse('$baseUrl/verify');
    var request = new http.MultipartRequest(
      "POST",
      url,
    );
    request.headers['authorization'] = 'Bearer $token';
    request.fields['account_number'] = amount;
    request.fields['bank'] = bank;
    request.files.add(new http.MultipartFile(
        'file',
        File(rawFile.path).readAsBytes().asStream(),
        File(rawFile.path).lengthSync(),
        filename: rawFile.path.split("/").last));

    await request.send().then((response) async {
      print("statuscode: ${response.statusCode}");
      var rb = await response.stream.bytesToString();
      print("resBody: $rb");

      if (response.statusCode == 200) {
        print(jsonDecode(rb)['status']);
        if (jsonDecode(rb)['status']) {
          Get.to(() => QuotstionSucess());
        } else {
          showCustomSnackBar('check account number');
        }
        // Get.to(()=>QuotstionSucess());
      } else if (response.statusCode == 401) {
        showCustomSnackBar('Error please try again');
      } else
        showCustomSnackBar('Error please try again');
    });
  } catch (e) {
    print(e);
  }
}

checkBank(bank, accountNumber) async {
  try {
    String token = await hiveCalls.getUserToken();
    var url = Uri.parse('$baseUrl/getAcc');
    var response = await http.post(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      'bank': bank,
      "account_number": accountNumber
    });
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['data']['status'] == true) {
        print('worked');
        return jsonDecode(response.body)['data']['data']['account_name'];
      } else {
        return 'incorrect account details';
      }
    } else if (response.statusCode == 500) {
      // showQuotationPopUp();
      showCustomSnackBar('accept quotation first');
    } else {
      showCustomSnackBar('error');
    }
  } catch (e) {
    print(e);
  }
}


// uploadVerification(File rawFile, amount) async {
//   // String fileData = base64Encode(rawFile.readAsBytesSync());
//   print(rawFile.uri);
//   try {
//     var token = await hiveCalls.getUserToken();
//     print(token);
//     var url = Uri.parse('$baseUrl/verify');
//     var request = new http.MultipartRequest(
//       "POST",
//       url,
//     );
//     request.headers['authorization'] = 'Bearer $token';
//     request.fields['account_number'] = amount;
//     request.files.add(new http.MultipartFile('file',
//         File(rawFile.path).readAsBytes().asStream(), File(rawFile.path).lengthSync(),
//         filename: rawFile.path.split("/").last));


//    await request.send().then((response) async {
//       print("statuscode: ${response.statusCode}");
//       var rb = await response.stream.bytesToString();
//       print("resBody: $rb");

//       if (response.statusCode == 201) {
    
        
//         Get.to(()=>VerificationSucessPage());
//       } else if (response.statusCode == 401) {
//         showCustomSnackBar('amount is about 100,000');
//       } else
//         showCustomSnackBar('Error please try again');
//     });
//   } catch (e) {
//     print(e);
//   }
// }