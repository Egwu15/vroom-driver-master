import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../apis/bankCall.dart';

import '../../apis/verificationController.dart';
import '../../Components/entryField.dart';
import '../../Components/snackBar.dart';

class UserVerification extends StatefulWidget {
  @override
  _UserVerificationState createState() => _UserVerificationState();
}

class _UserVerificationState extends State<UserVerification> {
  File file;
  TextEditingController amountTextController = TextEditingController();
  bool _isLoading = false;
  var selectedBank;
  bool _isBankloading = true;
  List<String> bank = [];
  String accountDetails = '';
  var banks;
  void _choosefile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      onFileLoading: (filePickerStatus) {
        print(filePickerStatus);
      },
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      file = File(result.files.single.path);
    } else {
      // User canceled the picker
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _setBanks();
  }

  _setBanks() async {
    // banks = await
    getBanks().then((banks) {
      print("banks: $banks['name']");
      print("bankName: ${banks[0]['name']}");
      selectedBank = banks[0]['name'];
      for (var i = 0; i < banks.length; i++) {
        bank.add("${banks[i]['name']}");
        // print('banks: $bank');
      }
      setState(() {});
    });
    print("banks2: $banks");
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: _isLoading
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.green,
                      ),
                      Text(
                        'Uploading ID please stay on screen',
                        softWrap: true,
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(clipBehavior: Clip.none, children: [
                      Image.asset(
                        'assets/referNowBg.png',
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                      PositionedDirectional(
                        top: 40,
                        start: 20,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: theme.scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        bottom: -35,
                        start: 30,
                        end: 30,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          color: theme.primaryColor,
                          child: Center(
                            child: Column(
                              children: [
                                // Text(
                                //   "Quotation",
                                //   style: theme.textTheme.bodyText2.copyWith(
                                //       color: theme.scaffoldBackgroundColor,
                                //       fontSize: 12),
                                // ),
                                Text(
                                  'Verification',
                                  style: theme.textTheme.headline6.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),

                    Form(
                        child: Padding(
                      padding: const EdgeInsets.only(
                          top: 100.0, left: 10.0, right: 10.0),
                      child: Column(
                        children: [
                          bank.length < 2
                              ? Text("loading banks...")
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Container(
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      // borderRadius:
                                      //     BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                          color:
                                              Theme.of(context).dividerColor),
                                      color: Theme.of(context).backgroundColor,
                                    ),
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: selectedBank,
                                      items: bank.map((e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30.0),
                                            child: Text(
                                              e,
                                              maxLines: 1,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedBank = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 15.0,
                          ),
                          EntryField(
                            controller: amountTextController,
                            label: 'Account Number',
                            keyBoardType: TextInputType.phone,
                            onChangedFunction: (value) {
                              if (value.length == 10) {
                                setState(() {
                                  accountDetails = "loading account...";
                                });
                                checkBank(
                                        selectedBank, amountTextController.text)
                                    .then((value) {
                                  setState(() {
                                    accountDetails = value;
                                  });
                                });
                              } else {
                                setState(() {
                                  accountDetails = '';
                                });
                              }
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(accountDetails)),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            height: 45.0,
                            width: MediaQuery.of(context).size.width * 0.83,
                            color: Colors.blue,
                            child: GestureDetector(
                              onTap: () => _choosefile(),
                              child: file != null
                                  ? Center(
                                      child:
                                          Text("${file.path.split("/").last}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.white,
                                              )))
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("upload attachment",
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                        Icon(
                                          Icons.upload_file,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            height: 55.0,
                            width: MediaQuery.of(context).size.width * 0.83,
                            color: Colors.blue,
                            child: GestureDetector(
                              onTap: () {
                                print(selectedBank);
                                setState(() {
                                  _isLoading = true;
                                });

                                if (file != null) {
                                  uploadVerification(
                                          file,
                                          amountTextController.value.text,
                                          selectedBank)
                                      .then((_) => setState(() {
                                            _isLoading = false;
                                          }));
                                } else {
                                  showCustomSnackBar('Add attachment');
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Send",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  // Icon(
                                  //   Icons.upload_outlined,
                                  //   color: Colors.white,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30.0)
                        ],
                      ),
                    ))
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 100, left: 28),
                    //   child: Text(
                    //     locale.referAndEarn,
                    //     style: theme.textTheme.headline6.copyWith(
                    //         color: theme.primaryColor,
                    //         fontSize: 19,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       left: 28.0, right: 28, top: 16, bottom: 20),
                    //   child: Text(
                    //     locale.shareTheReferralCode,
                    //     style: theme.textTheme.bodyText2,
                    //   ),
                    // ),
                    // Row(
                    //   children: [
                    //     Spacer(),
                    // Image.asset(
                    //       'assets/SocialIcons/ic_facebook.png',
                    //       height: 50,
                    //       width: 50,
                    //     ),
                    //     Spacer(),
                    //     Image.asset(
                    //       'assets/SocialIcons/ic_whatsapp.png',
                    //       height: 50,
                    //       width: 50,
                    //     ),
                    //     Spacer(),
                    //     Image.asset(
                    //       'assets/SocialIcons/ic_twitter.png',
                    //       height: 50,
                    //       width: 50,
                    //     ),
                    //     Spacer(),
                    //     Image.asset(
                    //       'assets/SocialIcons/ic_more.png',
                    //       height: 50,
                    //       width: 50,
                    //     ),
                    //     Spacer(),
                    //   ],
                    // ),
                  ],
                ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
