import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:vroom_driver/AppNavigation/app_navigation.dart';
import 'package:vroom_driver/Auth/Verification/otp.dart';
import 'package:vroom_driver/Components/snackBar.dart';
import 'package:vroom_driver/Others/Quotation/quotationSucess.dart';
import 'package:vroom_driver/apis/fireStoreDB.dart';
import 'package:vroom_driver/apis/hiveStorage.dart';
import 'package:vroom_driver/apis/pushNotification.dart';
import 'package:vroom_driver/models/tokenModel.dart';
import 'package:vroom_driver/models/userModel.dart';
import 'package:vroom_driver/models/userRegModel.dart';

HiveCalls hiveCalls = HiveCalls();
String pushToken;
Stream<String> _tokenStream;
String baseUrl = "https://tugent.tbmholdingltd.com/api";
int userId;

setPushToken(tok, userId) async {
  await hiveCalls.addPushToken(tok);
  await CloudDB().updatePushToken(tok, userId);
}

signUp({email, password, name, phoneNumber}) async {
  try {
    var url = Uri.parse('$baseUrl/agent_registration');
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
      'name': name,
      'phoneNumber': phoneNumber,
    });
    print(response.body);
    if (response.statusCode == 200) {
      await hiveCalls
          .addUserToken(userRegisterdModelFromJson(response.body).token);
      await getUserDetails(userRegisterdModelFromJson(response.body).token);

      await CloudDB()
          .setUserDetails(userid: await hiveCalls.getUserId(), name: name);
          await createPushToken(userId);
      Get.offAll(() => OtpPage());
    } else if (response.statusCode == 422) {
      showCustomSnackBar('email is already used');
    } else {
      showCustomSnackBar('Please check your network and try again');
    }
  } catch (e) {
    print(e);
  }
}

signIn({email, password}) async {
  try {
    var url = Uri.parse('$baseUrl/login_agent');
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
      'agent':'agent'
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print((tokenModelFromJson(response.body).token));
      if (jsonDecode(response.body)['status'] == "Please verify using Otp ") {
        return showCustomSnackBar('Unverified account!'); 
      } else {
        await hiveCalls
            .addUserToken(userRegisterdModelFromJson(response.body).token);

        await getUserDetails(tokenModelFromJson(response.body).token).then((_) {
          Get.offAll(
            () => AppNavigation(),
          );
        });
      }
    } else if (response.statusCode == 401) {
      showCustomSnackBar('Wrong username or password');
    } else {
      showCustomSnackBar('Please check your network and try again');
    }
  } catch (e) {
    print(e);
  }
}

getUserDetails(token) async {
  try {
    var url = Uri.parse('$baseUrl/user');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print("statuscode: ${response.body}");
    if (response.statusCode == 201) {
      userId = userModelFromJson(response.body).data.id;
      var userName = userModelFromJson(response.body).data.name;
      var userEmail = userModelFromJson(response.body).data.email;
      var picture = userModelFromJson(response.body).data.avater;
      var active = userModelFromJson(response.body).data.activewithUser;
      var phoneNumber = userModelFromJson(response.body).data.phoneNumber;
      var agentLevel = userModelFromJson(response.body).data.agentLevel;
      print("userid: $userId");
      await hiveCalls.addUserId(userId);
      
      await hiveCalls.addUserEmail(userEmail);
      await hiveCalls.addUserName(userName);
      await hiveCalls.addProfilePhoto(picture);
      await hiveCalls.addActiveWith(active);
      await hiveCalls.addPhoneNumber(phoneNumber);
      await hiveCalls.addAgentLevel(agentLevel);
      // print('object');
      //   Get.to(
      //     () => AppNavigation(),
      // );
    } else
      Get.to(() => signIn());
  } catch (e) {
    print(e);
  }
}

setQuotation(File rawFile, amount) async {
  // String fileData = base64Encode(rawFile.readAsBytesSync());
  print(rawFile.uri);
  try {
    var token = await hiveCalls.getUserToken();
    print(token);
    var url = Uri.parse('$baseUrl/quotation');
    var request = new http.MultipartRequest(
      "POST",
      url,
    );
    request.headers['authorization'] = 'Bearer $token';
    request.fields['amount'] = amount;
    request.files.add(new http.MultipartFile(
        'attachment',
        File(rawFile.path).readAsBytes().asStream(),
        File(rawFile.path).lengthSync(),
        filename: rawFile.path.split("/").last));

    // var response = await http.post(url, headers: {
    //   // 'Content-Type': 'application/json',
    //   // 'Accept': 'application/json',
    //   'Authorization': 'Bearer $token',
    // }, body: {
    //   "amount": amount,
    //   "attachment": fileData
    // });

    await request.send().then((response) async {
      print("statuscode: ${response.statusCode}");
      var rb = await response.stream.bytesToString();
      print("resBody: $rb");

      if (response.statusCode == 201 || response.statusCode == 200) {
        // print("userid: ${userModelFromJson(response.body).data.id}");
        // await hiveCalls.addUserId(userModelFromJson(response.body).data.id);
        // // print('object');
        //   Get.to(
        //     () => AppNavigation(),
        // );
        sendPushMessage();
        Get.back();
        showCustomSnackBar("Quotation Sent!");
      } else if (response.statusCode == 401) {
        showCustomSnackBar('amount is about 100,000');
      } else
        showCustomSnackBar('Error please try again');
    });
  } catch (e) {
    print(e);
  }
}

createPushToken(userId) {
  FirebaseMessaging.instance.getToken().then((tok) {
    setPushToken(tok, userId);
  });
  _tokenStream = FirebaseMessaging.instance.onTokenRefresh;
  _tokenStream.listen((tok) {
    setPushToken(tok, userId);
  });
}
