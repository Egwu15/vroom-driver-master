import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:vroom_driver/AppNavigation/app_navigation.dart';
import 'package:vroom_driver/Components/snackBar.dart';
import 'package:vroom_driver/apis/fireStoreDB.dart';
import 'package:vroom_driver/apis/hiveStorage.dart';
import 'package:vroom_driver/models/tokenModel.dart';
import 'package:vroom_driver/models/userModel.dart';
import 'package:vroom_driver/models/userRegModel.dart';

HiveCalls hiveCalls = HiveCalls();
signUp({email, password, name, phoneNumber}) async {
  try {
    var url = Uri.parse('https://tugent.hostify.com.ng/api/agent_registration');
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
      'name': name,
      'phoneNumber': phoneNumber,
    });
    print(response.body);
    if (response.statusCode == 200) {
     
      await getUserDetails(userRegisterdModelFromJson(response.body).token);
      await CloudDB()
          .setUserDetails(userid: await hiveCalls.getUserId(), name: name);
      Get.to(() => AppNavigation());
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
    var url = Uri.parse('https://tugent.hostify.com.ng/api/login');
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
    });
    print(response.body);
    if (response.statusCode == 200) {
      print((tokenModelFromJson(response.body).token));
      
      await getUserDetails(tokenModelFromJson(response.body).token).then((_) {
        Get.to(
          () => AppNavigation(),
        );
      });
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
    var url = Uri.parse('https://tugent.hostify.com.ng/api/user');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print("statuscode: ${response.statusCode}");
    if (response.statusCode == 201) {
      print("userid: ${userModelFromJson(response.body).data.id}");
      await hiveCalls.addUserId(userModelFromJson(response.body).data.id);
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

