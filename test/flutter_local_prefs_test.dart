import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_local_prefs/flutter_local_prefs.dart';
import 'package:flutter_local_prefs/flutter_local_prefs_platform_interface.dart';
import 'package:flutter_local_prefs/flutter_local_prefs_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterLocalPrefsPlatform
    with MockPlatformInterfaceMixin
    implements FlutterLocalPrefsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterLocalPrefsPlatform initialPlatform = FlutterLocalPrefsPlatform.instance;

  test('$MethodChannelFlutterLocalPrefs is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterLocalPrefs>());
  });

  test('getPlatformVersion', () async {
    FlutterLocalPrefs flutterLocalPrefsPlugin = FlutterLocalPrefs();
    MockFlutterLocalPrefsPlatform fakePlatform = MockFlutterLocalPrefsPlatform();
    FlutterLocalPrefsPlatform.instance = fakePlatform;

    expect(await flutterLocalPrefsPlugin.getPlatformVersion(), '42');
  });
}
