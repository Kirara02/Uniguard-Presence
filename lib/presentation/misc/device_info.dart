import 'package:flutter/services.dart';

class DeviceInfo {
  static const MethodChannel _channel = MethodChannel('device/info');

  static Future<String?> getAndroidId() async {
    final String? androidId = await _channel.invokeMethod('getDeviceId');
    return androidId;
  }
}
