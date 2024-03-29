import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vroom_driver/apis/invoice.dart';
import '../../apis/bankCall.dart';

import '../../apis/verificationController.dart';
import '../../Components/entryField.dart';
import '../../Components/snackBar.dart';

class InvoicePage extends StatefulWidget {
  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  File file;
  TextEditingController amountTextController = TextEditingController();
  bool _isLoading = false;

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
                        'Uploading Invoice please stay on screen',
                        softWrap: true,
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  'Invoice',
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

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 50.0, left: 10.0, right: 10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.0,
                          ),
                          Text("upload the invoice"),
                          SizedBox(height: 10.0),
                          GestureDetector(
                            onTap: () => _choosefile(),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.lightBlue[100].withOpacity(0.8),
                              ),
                              height: 140.0,
                              width: 180.0,
                              child: Center(
                                  child: CircleAvatar(
                                child: Icon(
                                  Icons.add,
                                  size: 40.0,
                                ),
                                radius: 30.0,
                                backgroundColor: Colors.blue,
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          if (file != null)
                            Container(
                              height: 45.0,
                              width: MediaQuery.of(context).size.width * 0.83,
                              color: Colors.blue,
                              child: Center(
                                  child: Text("${file.path.split("/").last}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))),
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
                                setState(() {
                                  _isLoading = true;
                                });

                              if (file != null) {
                                  uploadInvoice(file).then((_) => setState(() {
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
                    )
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
