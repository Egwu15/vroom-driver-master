
import 'dart:convert';

import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:get/instance_manager.dart';



  
class PushController extends GetxController {
  var pushToken = 'loading'.obs;
  // addbalance(currentbalance) => balance.value = currentbalance;
}
Future<void> sendPushMessage() async {
  PushController pushController = Get.find();
  var pushToken = pushController.pushToken.value;
    if (pushToken == null) {
      print('Unable to send FCM message, no token exists.');
      return;
    }

    try {
      var response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'Bearer AAAAxR02Itk:APA91bE-s7VfKNbjWLLL1W0Rrzo7KbHuRZmrwumXpNtEACU4T-Zhkk6QB7xihBoFqW-sJjZN2F4U1aKVe5TUzKGhPbhrfJVGA0NwjrPJSDd2XJAt9yVISC10OEu1xSJ3aleHT0EBCyTg',
        },
        body: constructFCMPayload(pushToken),
      );

      print('FCM request for device sent!');
      print(response.body);
    } catch (e) {
      print(e);
    }
  }


String constructFCMPayload(String token) {
    return jsonEncode({
      'token': token,
      'data': {
        'via': 'FlutterFire Cloud Messaging!!!',
        'count': "count",
      },
      'notification': {
        'title': 'Quotation',
        'body':"You have a quotation request",
      },
      'to': token,
    });
  }
