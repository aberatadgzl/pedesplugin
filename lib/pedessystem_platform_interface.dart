import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pedessystem_method_channel.dart';

abstract class PedessystemPlatform extends PlatformInterface {
  /// Constructs a PedessystemPlatform.
  PedessystemPlatform() : super(token: _token);

  static final Object _token = Object();

  static PedessystemPlatform _instance = MethodChannelPedessystem();

  /// The default instance of [PedessystemPlatform] to use.
  ///
  /// Defaults to [MethodChannelPedessystem].
  static PedessystemPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PedessystemPlatform] when
  /// they register themselves.
  static set instance(PedessystemPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> goRam() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
