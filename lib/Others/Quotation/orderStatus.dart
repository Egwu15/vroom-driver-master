import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:vroom_driver/Components/snackBar.dart';
import 'package:vroom_driver/apis/loanCall.dart';
import 'package:vroom_driver/apis/orderStatusCall.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({key}) : super(key: key);

  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  TextEditingController amountController = TextEditingController();
  bool _isLoading = false;
  String _orderValue = "Please choose an order status";
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
                          "Order status",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 100.0),
                    DropdownButton<String>(
                      focusColor: Colors.white,
                      value: _orderValue,
                      //elevation: 5,
                      style: TextStyle(color: Colors.white),
                      iconEnabledColor: Colors.black,
                      items: <String>[
                        "Please choose an order status",
                        'Goods have been Purchased',
                        'Goods is in Nigeria',
                        'Goods Delivered',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "Please choose an order status",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _orderValue = value;
                        });
                      },
                    ),
                    SizedBox(height: 120.0),
                    GestureDetector(
                      onTap: () {
                        
                        if (_orderValue == "Please choose an order status") {
                          showCustomSnackBar("enter order status");
                        } else {
                          setState(() {
                          _isLoading = true;
                        });
                          changeOrderStatus(_orderValue).then((_) {
                            setState(() {
                              _isLoading = false;
                            });
                          });
                        }
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
