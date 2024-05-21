import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'p10_printer_plugin_method_channel.dart';

abstract class P10PrinterPluginPlatform extends PlatformInterface {
  /// Constructs a P10PrinterPluginPlatform.
  P10PrinterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static P10PrinterPluginPlatform _instance = MethodChannelP10PrinterPlugin();

  /// The default instance of [P10PrinterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelP10PrinterPlugin].
  static P10PrinterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [P10PrinterPluginPlatform] when
  /// they register themselves.
  static set instance(P10PrinterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int?> getPrinterStatus() {
    throw UnimplementedError('printText() has not been implemented.');
  }

  Future<int?> lineWrap(int lines) {
    throw UnimplementedError('setLineSpace() has not been implemented.');
  }

  Future<int?> printPicture(Uint8List pic) {
    throw UnimplementedError('printPic() has not been implemented.');
  }
}
