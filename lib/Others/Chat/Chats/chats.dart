import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:vroom_driver/Locale/locales.dart';
import 'package:vroom_driver/Others/Chat/ChatConversation/chat_conversation.dart';
import 'package:vroom_driver/Routes/routes.dart';
import 'package:vroom_driver/Theme/colors.dart';
import 'package:vroom_driver/apis/hiveStorage.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class ListOfDrivers {
  final String image;
  final String title;
  final String subtitle;

  ListOfDrivers(this.image, this.title, this.subtitle);
}

int myID = 0;
int otherId = 0;

class _ChatsState extends State<Chats> {
  @override
  void initState() {
    super.initState();
    getUserId();
  }

  getUserId() async {
    myID = await HiveCalls().getUserId();
    print("userid: $myID");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<ListOfDrivers> _listOfDrivers = [
      ListOfDrivers('assets/ProfileImages/man1.png', 'David Johnson',
          'Washington Sq Park?'),
      ListOfDrivers(
          'assets/ProfileImages/man2.png', 'George Smith', locale.yeahSure),
      ListOfDrivers('assets/ProfileImages/man3.png', 'Remmy Hemilton',
          locale.yesWillReachBy),
      ListOfDrivers('assets/ProfileImages/man4.png', 'David Johnson',
          'Washington Sq Park?'),
      ListOfDrivers(
          'assets/ProfileImages/man5.png', 'George Smith', locale.yeahSure),
    ];
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: Icon(Icons.search),
          // ),
        ],
        automaticallyImplyLeading: false,
        title: Text(
          locale.chats.toUpperCase(),
          style: theme.textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              // .where('isLoggedIn', isEqualTo: true)
              // .where('isAgent', isEqualTo: false)
              .where('chatted', arrayContains: myID)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var doc = snapshot.data.docs[index];
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: Color(0xffE7EAEC),
                      ),
                      ListTile(
                        onTap: () {
                          otherId = doc['id'];
                          Get.to(() => ChatConversation());
                        },
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        leading: CircleAvatar(
                          radius: 24,
                          child: Image.asset(_listOfDrivers[index].image,
                              fit: BoxFit.fill),
                        ),
                        title: Row(
                          children: [
                            Text(doc['name'],
                                style: theme.textTheme.bodyText2.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                )),
                            SizedBox(
                              width: 8,
                            ),
                            CircleAvatar(
                              radius: 7,
                              child: Icon(
                                Icons.check,
                                color: theme.scaffoldBackgroundColor,
                                size: 12,
                              ),
                              backgroundColor: theme.primaryColor,
                            ),
                            Spacer(),
                            Text(
                              'June 22, 11:30 am',
                              style: theme.textTheme.subtitle2
                                  .copyWith(fontSize: 8),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          _listOfDrivers[index].subtitle,
                          style: theme.textTheme.bodyText2
                              .copyWith(color: hintTextColor, fontSize: 10),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: Color(0xffE7EAEC),
                      ),
                    ],
                  );
                },
              );
            }

            return Container();
          },
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
