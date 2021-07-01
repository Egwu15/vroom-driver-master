import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/route_manager.dart';
import 'package:vroom_driver/Auth/loginPage.dart';
import 'package:vroom_driver/Components/circularImage.dart';
import 'package:vroom_driver/Components/custom_button.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Others/Quotation/orderStatus.dart';
import 'package:vroom_driver/Others/Wallet/invoice.dart';
import 'package:vroom_driver/Others/Wallet/loan.dart';
import 'package:vroom_driver/Others/Wallet/payLoan.dart';
import 'package:vroom_driver/Routes/routes.dart';
import 'package:vroom_driver/Theme/colors.dart';
import 'package:vroom_driver/apis/fireStoreDB.dart';
import 'package:vroom_driver/apis/hiveStorage.dart';

class Me extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class AccountItems {
  final String title;
  final Widget icon;

  AccountItems(this.title, this.icon);
}

class _MeState extends State<Me> {
  int myId;
  String name = "";
  String email = "";
  String profilePic = "";
  HiveCalls hiveCalls = HiveCalls();
  @override
  void initState() {
    super.initState();
    getUserProperties();
  }

  getUserProperties() async {
    myId = await hiveCalls.getUserId();
    name = await hiveCalls.getUserName();
    email = await hiveCalls.getUserEmail();
    profilePic = await hiveCalls.getProfilePhoto();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context);

    List _accountItems = [
      AccountItems(
          locale.myProfile,
          FadedScaleAnimation(
            Icon(
              Icons.person,
              color: theme.primaryColor,
            ),
          )),
      AccountItems(
          "Loan",
          FadedScaleAnimation(
            Icon(
              Icons.money,
              color: theme.primaryColor,
            ),
          )),
      AccountItems(
          "Pay loan",
          FadedScaleAnimation(
            Icon(
              Icons.money_off_outlined,
              color: theme.primaryColor,
            ),
          )),
      AccountItems(
          "Invoice",
          FadedScaleAnimation(
            Icon(
              Icons.dashboard_customize,
              color: theme.primaryColor,
            ),
          )),
      AccountItems(
          "Order status",
          FadedScaleAnimation(
            Icon(
              Icons.online_prediction_rounded,
              color: theme.primaryColor,
            ),
          )),
      AccountItems(
          locale.notifications,
          FadedScaleAnimation(
            Icon(
              Icons.notifications,
              color: theme.primaryColor,
            ),
          )),
      AccountItems(
          locale.termsAndConditions,
          FadedScaleAnimation(
            Icon(
              Icons.list_alt_outlined,
              color: theme.primaryColor,
            ),
          )),
      AccountItems(
          locale.referAndEarn,
          FadedScaleAnimation(
            Icon(
              Icons.share,
              color: theme.primaryColor,
            ),
          )),
      AccountItems(
          locale.rateVroom,
          FadedScaleAnimation(
            Icon(
              Icons.thumb_up,
              color: theme.primaryColor,
            ),
          )),
      AccountItems(
          locale.help,
          FadedScaleAnimation(
            Icon(
              Icons.help,
              color: theme.primaryColor,
            ),
          )),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "me".toUpperCase(),
          style: theme.textTheme.headline6,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                FadedScaleAnimation(
                  // Container(
                  //   height: 70,
                  //   width: 70,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       image: DecorationImage(
                  //         image: NetworkImage(profilePic),
                  //       )),
                  // ),
                  circularImage(profilePic, 70.0),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        name,
                        style: theme.textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        //     Icon(
                        //       Icons.star,
                        //       color: secondaryColor,
                        //       size: 16,
                        //     ),
                        //     Icon(
                        //       Icons.star,
                        //       color: secondaryColor,
                        //       size: 16,
                        //     ),
                        //     Icon(
                        //       Icons.star,
                        //       color: secondaryColor,
                        //       size: 16,
                        //     ),
                        //     Icon(
                        //       Icons.star,
                        //       color: secondaryColor,
                        //       size: 16,
                        //     ),
                        //     Icon(
                        //       Icons.star,
                        //       color: secondaryColor,
                        //       size: 16,
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        Text(
                          email,
                          style: theme.textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 4,
            color: Color(0xffE7EAEC),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .where('id', isEqualTo: myId)
                .snapshots(),
            builder: (context, snapshot) {
              // if(snapshot.connectionState == ConnectionState.waiting){
              //   return Text('loading');
              // }
              if (snapshot.hasData && snapshot.data != null) {
                return ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  // reverse: true,
                  itemBuilder: (context, index) {
                    var doc = snapshot.data.docs[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: ListTile(
                        onTap: () {
                          CloudDB().setAgentOnline(doc['isLoggedIn'], myId);
                          setState(() {});
                        },
                        leading: Icon(
                          Icons.online_prediction,
                          color: doc['isLoggedIn'] == true
                              ? theme.primaryColor
                              : Colors.red,
                        ),
                        title: Text(
                          doc['isLoggedIn'] == true
                              ? "You are online"
                              : "You are offline",
                          style: theme.textTheme.bodyText1.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else
                return Container();
            },
          ),
          ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 24),
              physics: NeverScrollableScrollPhysics(),
              itemCount: _accountItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: index == 0
                      ? () {
                          Navigator.pushNamed(context, PageRoutes.myProfile);
                        }
                      : index == 1
                          ? () {
                              Get.to(() => LoanPage());
                            }
                          : index == 2
                              ? () {
                                  Get.to(() => PayLoanPage());
                                }
                              : index == 3
                                  ? () {
                                      Get.to(() => InvoicePage());
                                    }
                              : index == 4
                                  ? () {
                                      Get.to(() => OrderStatus());
                                    }
                                  : index == 5
                                      ? () {
                                          Navigator.pushNamed(context,
                                              PageRoutes.notifications);
                                        }
                                      : index == 6
                                          ? () {
                                              Navigator.pushNamed(
                                                  context,
                                                  PageRoutes
                                                      .termsAndConditions);
                                            }
                                          : index == 7
                                              ? () {
                                                  Navigator.pushNamed(context,
                                                      PageRoutes.referNow);
                                                }
                                              : index == 8
                                                  ? () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          PageRoutes.help);
                                                    }
                                                  : index == 9
                                                      ? () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              PageRoutes
                                                                  .changeLanguage);
                                                        }
                                                      : () {},
                  leading: _accountItems[index].icon,
                  title: Text(
                    _accountItems[index].title,
                    style: theme.textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }),
          Container(
            width: double.infinity,
            height: 4,
            color: Color(0xffE7EAEC),
          ),
          CustomButton(
            onTap: () {
              Get.off(() => LoginPage());
            },
            bgColor: theme.scaffoldBackgroundColor,
            labelStyle: theme.textTheme.headline6.copyWith(
                color: theme.primaryColor, fontWeight: FontWeight.w500),
            label: locale.logout,
            height: 40,
          ),
          Container(
            width: double.infinity,
            height: 4,
            color: Color(0xffE7EAEC),
          ),
        ],
      ),
    );
  }
}
