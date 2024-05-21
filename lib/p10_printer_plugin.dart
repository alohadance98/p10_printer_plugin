import 'dart:typed_data';

import 'p10_printer_plugin_platform_interface.dart';

class P10PrinterPlugin {
  Future<int?> getPrinterStatus() {
    return P10PrinterPluginPlatform.instance.getPrinterStatus();
  }

  Future<int?> lineWrap(int lines) {
    return P10PrinterPluginPlatform.instance.lineWrap(lines);
  }

  Future<int?> printPicture(Uint8List picture) {
    return P10PrinterPluginPlatform.instance.printPicture(picture);
  }
}
