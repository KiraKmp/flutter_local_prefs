import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_local_prefs_method_channel.dart';

abstract class FlutterLocalPrefsPlatform extends PlatformInterface {
  /// Constructs a FlutterLocalPrefsPlatform.
  FlutterLocalPrefsPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterLocalPrefsPlatform _instance = MethodChannelFlutterLocalPrefs();

  /// The default instance of [FlutterLocalPrefsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterLocalPrefs].
  static FlutterLocalPrefsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterLocalPrefsPlatform] when
  /// they register themselves.
  static set instance(FlutterLocalPrefsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future saveData({
    required Object object,
    required String key,
    bool isPersistent = false,
  }) async {
    throw ("Unimplemented method");
  }

  Future<int> getInt({
    required String key,
    bool isPersistent = false,
  }) async {
    throw ("Unimplemented method");
  }

  Future<String> getString({
    required String key,
    bool isPersistent = false,
  }) async {
    throw ("Unimplemented method");
  }

  Future<bool> getBool({
    required String key,
    bool isPersistent = false,
  }) async {
    throw ("Unimplemented method");
  }

  Future<double> getDouble({
    required String key,
    bool isPersistent = false,
  }) async {
    throw ("Unimplemented method");
  }

  // Future getFloat({required String key}) async {
  //   throw ("Unimplemented method");
  // }

  Future getLong({
    required String key,
    bool isPersistent = false,
  }) async {
    throw ("Unimplemented method");
  }

  Future removeAll({bool isPersistent = false}) async {
    throw ("Unimplemented method");
  }

  Future remove({
    required String key,
    bool isPersistent = false,
  }) async {
    throw ("Unimplemented method");
  }

  Future<bool> contain({
    required String key,
    bool isPersistent = false,
  }) async {
    throw ("Unimplemented method");
  }
}
