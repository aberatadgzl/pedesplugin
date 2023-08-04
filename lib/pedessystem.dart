
import 'pedessystem_platform_interface.dart';

class Pedessystem {
  Future<String?> goRam() {
    return PedessystemPlatform.instance.goRam();
  }
}
