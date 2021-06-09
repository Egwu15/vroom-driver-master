import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vroom_driver/Components/entryField.dart';
import 'package:vroom_driver/Components/snackBar.dart';
import 'package:vroom_driver/apis/authCall.dart';

class ReferNow extends StatefulWidget {
  @override
  _ReferNowState createState() => _ReferNowState();
}

class _ReferNowState extends State<ReferNow> {
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
                        'Uploading quotation please stay on screen',
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
                                  'Quotation',
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
                          EntryField(
                            controller: amountTextController,
                            label: 'Amount',
                            keyBoardType: TextInputType.phone,
                          ),
                          SizedBox(
                            height: 30.0,
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
                                setState(() {
                                  _isLoading = true;
                                });
                                
                                if (file != null) {
                                  setQuotation(
                                          file, amountTextController.value.text)
                                      .then((_) => setState(() {
                                        
                                            _isLoading = false;
                                          }));
                                } else {
                                  showCustomSnackBar('Add quotation pdf');
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Send Quotation",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  Icon(
                                    Icons.send_outlined,
                                    color: Colors.white,
                                  ),
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
