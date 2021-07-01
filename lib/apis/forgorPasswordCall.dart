import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:vroom_driver/Auth/confirmPassword.dart';
import 'package:vroom_driver/Auth/loginPage.dart';
import 'package:vroom_driver/Components/snackBar.dart';
import 'authCall.dart';

forgotPasswordCall(email) async {
  try {
    var response = await http.post(Uri.parse("$baseUrl/forgotPassword"),
        headers: {"Accept": "application/json"}, body: {'email': email});
    if (response.statusCode == 201) {
      Get.to(() => ConfirmPassword());
    } else {
      showCustomSnackBar('Error resetting password!');
    }
    print(response.body);
  } on Exception catch (e) {
    print(e);
  }
}

checkPin(code, password) async {
  try {
    var response = await http.post(Uri.parse("$baseUrl/reset"),
        headers: {"Accept": "application/json"},
        body: {'code': code, 'password': password});
    if (response.statusCode == 201) {
      Get.off(() => LoginPage());
      showCustomSnackBar('Password reset sucessful!');
    } else
      showCustomSnackBar('Error resetting password!');
    print(response.body);
    print(response.statusCode);
  } on Exception catch (e) {
    print(e);
  }
}
