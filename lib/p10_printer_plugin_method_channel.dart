import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'p10_printer_plugin_platform_interface.dart';

/// An implementation of [P10PrinterPluginPlatform] that uses method channels.
class MethodChannelP10PrinterPlugin extends P10PrinterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('p10_printer_plugin');

  @override
  Future<int?> getPrinterStatus() async {
    int? value = await methodChannel.invokeMethod<int>('getPrinterStatus');
    return value;
  }

  @override
  Future<int?> lineWrap(int lines) async {
    int? value =
        await methodChannel.invokeMethod<int>('lineWrap', {"lines": lines});
    return value;
  }

  @override
  Future<int?> printPicture(Uint8List pic) async {
    int? value =
        await methodChannel.invokeMethod<int>('printPicture', {"picture": pic});
    return value;
  }
}
