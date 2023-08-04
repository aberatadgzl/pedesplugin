import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pedessystem/pedessystem_method_channel.dart';

void main() {
  MethodChannelPedessystem platform = MethodChannelPedessystem();
  const MethodChannel channel = MethodChannel('pedessystem');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('goRam', () async {
    expect(await platform.goRam(), '42');
  });
}
