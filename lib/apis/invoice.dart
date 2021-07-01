import 'dart:convert';
import 'dart:io';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:vroom_driver/Others/Quotation/quotationSucess.dart';
import 'authCall.dart';
import '../Components/snackBar.dart';

uploadInvoice(
  File rawFile,
) async {
  // String fileData = base64Encode(rawFile.readAsBytesSync());
  print(rawFile.uri);
  try {
    var token = await hiveCalls.getUserToken();
    print(token);
    var url = Uri.parse('$baseUrl/invoice');
    var request = new http.MultipartRequest(
      "POST",
      url,
    );
    request.headers['authorization'] = 'Bearer $token';
    request.files.add(new http.MultipartFile(
        'attachment',
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
