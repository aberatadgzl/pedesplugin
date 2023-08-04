import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pedessystem_platform_interface.dart';

/// An implementation of [PedessystemPlatform] that uses method channels.
class MethodChannelPedessystem extends PedessystemPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pedessystem');

  @override
  Future<String?> goRam() async {
    final version = await methodChannel.invokeMethod<String>('goRam');
    return version;
  }
}
