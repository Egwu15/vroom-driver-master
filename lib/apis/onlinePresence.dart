import 'package:firebase_database/firebase_database.dart';
import 'hiveStorage.dart';

class Database {
  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference();

  updateUserPresence() async {
    Map<String, dynamic> presenceStatusTrue = {
      'isLoggedIn': true,
      // 'last_seen': DateTime.now().millisecondsSinceEpoch,
    };
    var userId = await HiveCalls().getUserId();

    await databaseReference
        .child(userId.toString())
        .update(presenceStatusTrue)
        .whenComplete(() => print('Updated your presence.'))
        .catchError((e) => print(e));

    Map<String, dynamic> presenceStatusFalse = {
      'isLoggedIn': false,
      // 'last_seen': DateTime.now().millisecondsSinceEpoch,
    };

    databaseReference.child(userId.toString()).onDisconnect().update(presenceStatusFalse);
  }
}
