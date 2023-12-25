import 'package:hive_flutter/adapters.dart';

const String dataAutomation = "DataAutomation";

class HiveHelper {
  static init() async {
    await Hive.initFlutter();

    await openDataAutomationBox();
  }

  static Future<Box> openDataAutomationBox() async {
    return await Hive.openBox(dataAutomation);
  }

  Future<void> closeBoxs() async {
    return await Hive.close();
  }

  getData(String key) {
    final prayerBox = Hive.box(dataAutomation);
    return prayerBox.get(key);
  }

  removeData(String key) {
    final prayerBox = Hive.box(dataAutomation);
    return prayerBox.delete(key);
  }

  Future<void> putData(String key, dynamic value) async {
    final prayerBox = Hive.box(dataAutomation);
    return prayerBox.put(key, value);
  }
}
