import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:vroom_driver/Components/snackBar.dart';
import 'package:vroom_driver/apis/hiveStorage.dart';
import 'authCall.dart';

changeOrderStatus(status) async {
  String token = await HiveCalls().getUserToken();
  try {
    var response = await http.post(Uri.parse("$baseUrl/orderStatus"), headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
    }, body: {
      "status": status
    });
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 201) {
      Get.back();
      showCustomSnackBar("Order status changed sucessfully!!");
    } else {
      showCustomSnackBar("error changing order status");
    }
  } on Exception catch (e) {
    print(e);
  }
}
