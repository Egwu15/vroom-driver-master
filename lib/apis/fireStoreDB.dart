import 'package:cloud_firestore/cloud_firestore.dart';

class CloudDB {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  setUserDetails({userid, name}) {
    firestore
        .collection('users')
        .doc(userid.toString())
        .set({"id": userid, "isLoggedIn": true, 'name': name, 'isAgent': true});
  }

  setAgentOnline(isOnline, userId) {
    bool onlineValue;
    isOnline ? onlineValue = false : onlineValue = true;

    firestore.collection('users').doc(userId.toString()).update({
      "isLoggedIn": onlineValue,
    });
  }

  updatePushToken(pushToken, userId) {
    firestore.collection('users').doc(userId.toString()).update({
      "pushToken": pushToken,
    });
  }

  // getAgentOnline({userId}) {
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(userId)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       print(documentSnapshot.data().length);
  //     }
  //   });
  // }

  // Widget isOnlineWidget({myID, widget}) {
  //   return StreamBuilder<QuerySnapshot>(
  //     stream: FirebaseFirestore.instance
  //         .collection('users')
  //         .where('id', isEqualTo: myID)
  //         .snapshots(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData && snapshot.data != null) {
  //         return ListView.builder(
  //           itemCount: snapshot.data.docs.length,
  //           shrinkWrap: true,
  //           itemBuilder: (context, index) {
  //             var doc = snapshot.data.docs[index];
  //             return AccountItems(
  //         isOnline ? "You are offline" : "you are offline",
  //         FadedScaleAnimation(
  //           Icon(
  //             Icons.online_prediction,
  //             color: isOnline ? Colors.red : theme.primaryColor,
  //           ),
  //         )),
  //           },
  //         );
  //       }

  //       return Container();
  //     },
  //   );
  // }
}
