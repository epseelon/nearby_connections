
import 'nearby_connections_platform_interface.dart';

class NearbyConnections {
  Future<String?> getPlatformVersion() {
    return NearbyConnectionsPlatform.instance.getPlatformVersion();
  }
}
