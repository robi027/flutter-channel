import 'package:flutter/services.dart';

class NativeChannel {
  static const platform = MethodChannel("com.robi027.flutterchannel/native");

  Future<String> sendToNative(String data) async {
    var value = await platform.invokeMethod("TONATIVE", data);
    print("[NativeChannel] $value}");
    return value;
  }
}
