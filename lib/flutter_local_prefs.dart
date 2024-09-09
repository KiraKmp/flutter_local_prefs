
import 'flutter_local_prefs_platform_interface.dart';

class FlutterLocalPrefs {
  Future saveData({
    required Object object,
    required String key,
    bool isPersistent = false,
  }) async {
    return await FlutterLocalPrefsPlatform.instance
        .saveData(object: object, key: key, isPersistent: isPersistent);
  }

  Future<int> getInt({
    required String key,
    bool isPersistent = false,
  }) async {
    return await FlutterLocalPrefsPlatform.instance
        .getInt(key: key, isPersistent: isPersistent);
  }

  Future<String> getString({
    required String key,
    bool isPersistent = false,
  }) async {
    return await FlutterLocalPrefsPlatform.instance
        .getString(key: key, isPersistent: isPersistent);
  }

  Future<bool> getBool({
    required String key,
    bool isPersistent = false,
  }) async {
    return await FlutterLocalPrefsPlatform.instance
        .getBool(key: key, isPersistent: isPersistent);
  }

  Future<double> getDouble({
    required String key,
    bool isPersistent = false,
  }) async {
    return await FlutterLocalPrefsPlatform.instance
        .getDouble(key: key, isPersistent: isPersistent);
  }

  // Future getFloat({required String key}) async {
  //   return await OpenSharedPreferencesPlatform.instance.getFloat(key: key);
  // }

  Future getLong({
    required String key,
    bool isPersistent = false,
  }) async {
    return await FlutterLocalPrefsPlatform.instance
        .getLong(key: key, isPersistent: isPersistent);
  }

  Future removeAll({bool isPersistent = false}) async {
    await FlutterLocalPrefsPlatform.instance
        .removeAll(isPersistent: isPersistent);
  }

  Future remove({
    required String key,
    bool isPersistent = false,
  }) async {
    await FlutterLocalPrefsPlatform.instance
        .remove(key: key, isPersistent: isPersistent);
  }

  Future<bool> contain({
    required String key,
    bool isPersistent = false,
  }) async {
    return await FlutterLocalPrefsPlatform.instance
        .contain(key: key, isPersistent: isPersistent);
  }
}
