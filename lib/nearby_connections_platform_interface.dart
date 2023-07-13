import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'nearby_connections_method_channel.dart';

abstract class NearbyConnectionsPlatform extends PlatformInterface {
  /// Constructs a NearbyConnectionsPlatform.
  NearbyConnectionsPlatform() : super(token: _token);

  static final Object _token = Object();

  static NearbyConnectionsPlatform _instance = MethodChannelNearbyConnections();

  /// The default instance of [NearbyConnectionsPlatform] to use.
  ///
  /// Defaults to [MethodChannelNearbyConnections].
  static NearbyConnectionsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NearbyConnectionsPlatform] when
  /// they register themselves.
  static set instance(NearbyConnectionsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
