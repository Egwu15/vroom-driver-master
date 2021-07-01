import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:vroom_driver/apis/loanCall.dart';
import 'package:vroom_driver/apis/withdrawCall.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({key}) : super(key: key);

  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  TextEditingController amountController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          // Positioned.fill(

          //   child: Image.asset("assets/cloud.png", color: Colors.blue, fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,),

          // ),

          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.lightBlue[50],
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    Image.asset("assets/lgo.png"),
                    SizedBox(height: 40.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 40.0,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Withdraw",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 100.0),
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        prefixIcon: Icon(
                          Icons.mobile_friendly_rounded,
                          color: Colors.blue,
                        ),
                        labelText: 'Enter the amount',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 120.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isLoading = true;
                        });
                       withdraw(amountController.text).then((_) {
                          setState(() {
                            _isLoading = false;
                          });
                        });
                      },
                      child: _isLoading
                          ? CircularProgressIndicator.adaptive()
                          : Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50.0,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  "Apply",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
