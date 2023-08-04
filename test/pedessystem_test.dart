import 'package:flutter_test/flutter_test.dart';
import 'package:pedessystem/pedessystem.dart';
import 'package:pedessystem/pedessystem_platform_interface.dart';
import 'package:pedessystem/pedessystem_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPedessystemPlatform
    with MockPlatformInterfaceMixin
    implements PedessystemPlatform {

  @override
  Future<String?> goRam() => Future.value('42');
}

void main() {
  final PedessystemPlatform initialPlatform = PedessystemPlatform.instance;

  test('$MethodChannelPedessystem is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPedessystem>());
  });

  test('goRam', () async {
    Pedessystem pedessystemPlugin = Pedessystem();
    MockPedessystemPlatform fakePlatform = MockPedessystemPlatform();
    PedessystemPlatform.instance = fakePlatform;

    expect(await pedessystemPlugin.goRam(), '42');
  });
}
