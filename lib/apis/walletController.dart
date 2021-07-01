import 'dart:convert';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'package:vroom_driver/apis/authCall.dart';
import 'package:vroom_driver/apis/hiveStorage.dart';

getWallet()async{
try {
  WalletController walletController = Get.put(WalletController());
  String token = await HiveCalls().getUserToken();
    var url = Uri.parse('$baseUrl/wallet');
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print("statuscode: ${response.body}");
      walletController.addbalance( jsonDecode(response.body)['data'][0]['balance'].toString());
     
      
} on Exception catch (e) {
  print(e);
}
}



class WalletController extends GetxController {
  var balance = 'loading'.obs;
  addbalance(currentbalance) => balance.value = currentbalance;
}
