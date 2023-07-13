import 'package:flutter_test/flutter_test.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:nearby_connections/nearby_connections_platform_interface.dart';
import 'package:nearby_connections/nearby_connections_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNearbyConnectionsPlatform
    with MockPlatformInterfaceMixin
    implements NearbyConnectionsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NearbyConnectionsPlatform initialPlatform = NearbyConnectionsPlatform.instance;

  test('$MethodChannelNearbyConnections is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNearbyConnections>());
  });

  test('getPlatformVersion', () async {
    NearbyConnections nearbyConnectionsPlugin = NearbyConnections();
    MockNearbyConnectionsPlatform fakePlatform = MockNearbyConnectionsPlatform();
    NearbyConnectionsPlatform.instance = fakePlatform;

    expect(await nearbyConnectionsPlugin.getPlatformVersion(), '42');
  });
}
