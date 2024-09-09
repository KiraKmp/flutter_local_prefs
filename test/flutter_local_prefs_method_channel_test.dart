import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_local_prefs/flutter_local_prefs_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlutterLocalPrefs platform = MethodChannelFlutterLocalPrefs();
  const MethodChannel channel = MethodChannel('flutter_local_prefs');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        switch (methodCall.method) {
          case 'save':
            return null;
          case 'getInt':
            return 42;
          case 'getString':
            return 'test';
          case 'getBool':
            return true;
          case 'getDouble':
            return 3.14;
          case 'getLong':
            return 1234567890;
          case 'removeAll':
            return null;
          case 'remove':
            return null;
          case 'contains':
            return true;
          case 'removePermanentDataKeys':
            return null;
          default:
            throw PlatformException(code: 'Unimplemented', details: null);
        }
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('saveData', () async {
    
    expect(await platform.saveData(object: "kira", key: "name"), null);
  });

    test('getData', () async {
    String name =   await platform.getString( key: "name");
    print(name);
    expect(name, "test");
  });
}
