import 'package:hive/hive.dart';

class HiveCalls {
  var box;
  static const HIVE_USER_ID = 'UserId';
  static const HIVE_USER_TOKEN = 'UserToken';
  static const HIVE_USER_NAME = 'userName';
  static const HIVE_USER_EMAIL = 'userEmail';
  static const HIVE_USER_PICTURE = 'profilePicture';
  static const HIVE_PUSH_TOkEN = 'PushToken';
  static const HIVE_ACTIVE = 'activeWith';
  static const HIVE_PHONE_NUMBER = 'phoneNumber';
  static const HIVE_AGENT_LEVEL = 'agentLevel';


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

  addUserToken(userToken) async {
    await initHiveDb();
    await box.put(HIVE_USER_TOKEN, userToken);
    print(userToken);
  }

  getUserToken() async {
    await initHiveDb();
    return box.get(HIVE_USER_TOKEN);
  }

  addPushToken(pushToken) async {
    await initHiveDb();
    await box.put(HIVE_PUSH_TOkEN, pushToken);
    print("pushtoken: $pushToken");
  }

  getPushToken() async {
    await initHiveDb();
    return box.get(HIVE_PUSH_TOkEN);
  }

  addUserName(userName) async {
    await initHiveDb();
    await box.put(HIVE_USER_NAME, userName);
    print("username: $userName");
  }

  getUserName() async {
    await initHiveDb();
    return box.get(HIVE_USER_NAME);
  }

  addProfilePhoto(photo) async {
    await initHiveDb();
    await box.put(HIVE_USER_PICTURE, photo);
    print("photo: $photo");
  }

  getProfilePhoto() async {
    await initHiveDb();
    return box.get(HIVE_USER_PICTURE);
  }

  addUserEmail(email) async {
    await initHiveDb();
    await box.put(HIVE_USER_EMAIL, email);
    print("email: $email");
  }

  getUserEmail() async {
    await initHiveDb();
    return box.get(HIVE_USER_EMAIL);
  }
   addActiveWith(activeWith) async {
    await initHiveDb();
    await box.put(HIVE_ACTIVE, activeWith);
    print("active: $activeWith");
  }

  getActiveWith() async {
    await initHiveDb();
    return box.get(HIVE_ACTIVE);
  }
  addPhoneNumber(phoneNumber) async {
    await initHiveDb();
    await box.put(HIVE_PHONE_NUMBER, phoneNumber);
    print("phone: $phoneNumber");
  }

  getPhoneNumber() async {
    await initHiveDb();
    return box.get(HIVE_PHONE_NUMBER);
  }
  addAgentLevel(agentLevel) async {
    await initHiveDb();
    await box.put(HIVE_AGENT_LEVEL, agentLevel);
    print("agentLevel: $agentLevel");
  }

  getAgentLevel() async {
    await initHiveDb();
    return box.get(HIVE_AGENT_LEVEL);
  }
}
