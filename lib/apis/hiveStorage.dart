import 'package:hive/hive.dart';

class HiveCalls {
  var box;
  static const HIVE_USER_ID = 'UserId';


  initHiveDb() async {
    box = await Hive.openBox('box');
  }

  addUserId(userId) async {
    await initHiveDb();
    await box.put(HIVE_USER_ID, userId);
    print(userId);
  }

  getUserId() async {
    await initHiveDb();
    return box.get(HIVE_USER_ID);
  }

 
}
