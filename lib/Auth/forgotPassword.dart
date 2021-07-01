import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:vroom_driver/Auth/forgotPassword.dart';
import 'package:vroom_driver/apis/forgorPasswordCall.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80.0),
                Center(
                  child: Text(
                    'Forgot Password',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Image.asset(
                  "assets/OTP 2.png",
                  height: 100.0,
                ),
                SizedBox(
                  height: 35.0,
                ),
                Text(
                  "Enter the email address associated with  your account ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 60.0),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: emailController,
                    validator: FormBuilderValidators.email(context,
                        errorText: 'Incorrect email format'),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        labelText: 'Email',
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(height: 40.0),
                if (_isLoading) CircularProgressIndicator.adaptive() else GestureDetector(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            forgotPasswordCall(emailController.text).then((_) {
                              setState(() {
                                _isLoading = false;
                              });
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50.0,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Reset",
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
    );
  }
}
