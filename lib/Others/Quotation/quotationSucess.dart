import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vroom_driver/AppNavigation/app_navigation.dart';

class QuotstionSucess extends StatelessWidget {
  const QuotstionSucess({key, this.sucesstext}) : super(key: key);
  final String sucesstext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: Get.height * 0.85,
            color: Color(0xff2196F3),
            child: Column(
              children: [
                SizedBox(
                  height: 150.0,
                ),
                Text(
                  "Yeah! You Did It!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Image.asset(
                  "assets/cupGuy2.png",
                  height: 200.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  sucesstext ?? "Pending Verification",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: GestureDetector(
                  onTap: () => Get.off(() => AppNavigation()),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50.0,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Great",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
