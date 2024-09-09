import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_local_prefs_platform_interface.dart';

enum PreferencesConstants {
  save,
  getInt,
  getString,
  getBool,
  getDouble,
  getLong,
  removeAll,
  remove,
  contains,
  key,
  value,
  removePermanentDataKeys,
  isPersistant,
}

const keyPrefix = "flutter_local_prefs.";
const permanentKey = "flutter_local_prefs_permanent.";

/// An implementation of [FlutterLocalPrefsPlatform] that uses method channels.
class MethodChannelFlutterLocalPrefs extends FlutterLocalPrefsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_local_prefs');

  @override
  Future saveData({
    required Object object,
    required String key,
    bool isPersistent = false,
  }) async {
    await methodChannel.invokeMethod(PreferencesConstants.save.name, {
      PreferencesConstants.key.name:
          isPersistent == true ? permanentKey + key : keyPrefix + key,
      PreferencesConstants.value.name: object,
      PreferencesConstants.isPersistant.name: isPersistent,
    });
  }

  @override
  Future<int> getInt({
    required String key,
    bool isPersistent = false,
  }) async {
    return await methodChannel.invokeMethod(PreferencesConstants.getInt.name, {
      PreferencesConstants.key.name:
          isPersistent == true ? permanentKey + key : keyPrefix + key,
      PreferencesConstants.isPersistant.name: isPersistent,
    });
  }

  @override
  Future<String> getString({
    required String key,
    bool isPersistent = false,
  }) async {
    return await methodChannel.invokeMethod(PreferencesConstants.getString.name, {
      PreferencesConstants.key.name:
          isPersistent == true ? permanentKey + key : keyPrefix + key,
      PreferencesConstants.isPersistant.name: isPersistent,
    });
  }

  @override
  Future<bool> getBool({
    required String key,
    bool isPersistent = false,
  }) async {
    return await methodChannel.invokeMethod(PreferencesConstants.getBool.name, {
      PreferencesConstants.key.name:
          isPersistent == true ? permanentKey + key : keyPrefix + key,
      PreferencesConstants.isPersistant.name: isPersistent,
    });
  }

  @override
  Future<double> getDouble({
    required String key,
    bool isPersistent = false,
  }) async {
    return await methodChannel.invokeMethod(PreferencesConstants.getDouble.name, {
      PreferencesConstants.key.name:
          isPersistent == true ? permanentKey + key : keyPrefix + key,
      PreferencesConstants.isPersistant.name: isPersistent,
    });
  }

  // @override
  // Future getFloat({required String key}) async {
  //   return await methodChannel.invokeMethod('getFloat', {"key": key});
  // }

  @override
  Future getLong({
    required String key,
    bool isPersistent = false,
  }) async {
    return await methodChannel.invokeMethod(PreferencesConstants.getLong.name, {
      PreferencesConstants.key.name:
          isPersistent == true ? permanentKey + key : keyPrefix + key,
      PreferencesConstants.isPersistant.name: isPersistent,
    });
  }

  @override
  Future removeAll({bool isPersistent = false}) async {
    isPersistent == true
        ? await methodChannel.invokeMapMethod(
            PreferencesConstants.removePermanentDataKeys.name,
            {PreferencesConstants.isPersistant.name: isPersistent})
        : await methodChannel.invokeMapMethod(PreferencesConstants.removeAll.name,
            {PreferencesConstants.isPersistant.name: isPersistent});
  }

  @override
  Future remove({
    required String key,
    bool isPersistent = false,
  }) async {
    await methodChannel.invokeMethod(PreferencesConstants.remove.name, {
      PreferencesConstants.key.name:
          isPersistent == true ? permanentKey + key : keyPrefix + key,
      PreferencesConstants.isPersistant.name: isPersistent,
    });
  }

  @override
  Future<bool> contain({
    required String key,
    bool isPersistent = false,
  }) async {
    return await methodChannel.invokeMethod(PreferencesConstants.contains.name, {
      PreferencesConstants.key.name:
          isPersistent == true ? permanentKey + key : keyPrefix + key,
      PreferencesConstants.isPersistant.name: isPersistent,
    });
  }
}
