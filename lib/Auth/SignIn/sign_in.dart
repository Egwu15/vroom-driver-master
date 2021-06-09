import 'dart:ui';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Components/custom_button.dart';
import 'package:vroom_driver/Components/entryField.dart';
import 'package:vroom_driver/Components/snackBar.dart';
import 'package:vroom_driver/Routes/routes.dart';
import 'package:vroom_driver/apis/authCall.dart';

class SignInUI extends StatefulWidget {
  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
   double screenHeight =Get.height * 0.35;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: FadedSlideAnimation(
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                // Stack(children: [
                //   Image.asset(
                //     'assets/shopping.jpg',
                //     scale: 1,
                //     height: MediaQuery.of(context).size.height * 0.45,
                //     width: MediaQuery.of(context).size.width,
                //     fit: BoxFit.fill,
                //   ),
                //   PositionedDirectional(
                //     top: 40,
                //     start: 40,
                //     end: 0,
                //     child: Text(
                //       locale.signIn,
                //       style: theme.textTheme.headline6,
                //     ),
                //   ),
                // ]),
                // SizedBox(
                //   height: 50,
                // ),
                Padding(
                  padding:EdgeInsets.only(top: screenHeight),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        EntryField(
                          controller: emailController,
                          label: locale.emailAddress,

                          keyBoardType: TextInputType.emailAddress,
                          validator: FormBuilderValidators.email(context,
                              errorText: 'Incorrect email format'),
                          // initialValue: 'george@mail.com',
                        ),
                        EntryField(
                          controller: passwordController,
                          label: locale.password,
                          obscured: true,
                          // initialValue: '*  *  *  *  *',
                          borderRadiusBottomLeft: Radius.circular(12),
                          borderRadiusBottomRight: Radius.circular(12),
                          validator: FormBuilderValidators.minLength(context, 5,
                              errorText: "5 dights at least"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                _isLoading
                    ? Container(
                        color: Colors.white12,
                        child: Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.blue,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                      )
                    : CustomButton(
                        height: 50,
                        onTap: () {
                          // Navigator.pushNamed(context, PageRoutes.verification);
                          if (_formKey.currentState.validate()) {
                            setState(() => _isLoading = true);

                            signIn(
                              email: emailController.value.text,
                              password: passwordController.value.text,
                            ).then(
                                (value) => setState(() => _isLoading = false));
                          } else {
                            showCustomSnackBar('Please fill form correctly');
                          }
                        },
                        label: locale.login,
                        labelStyle: theme.textTheme.headline6,
                      ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Row(
                    children: [
                      Text(
                        locale.newUser + ' ',
                        style: theme.textTheme.caption,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, PageRoutes.signUp);
                        },
                        child: Text(
                          locale.signUp,
                          style: theme.textTheme.caption.copyWith(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      Text(
                        locale.forgot + ' ',
                        style: theme.textTheme.caption,
                      ),
                      Text(
                        locale.password + '?',
                        style: theme.textTheme.caption.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          beginOffset: Offset(0, 0.3),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ),
      ),
    );
  }
}
