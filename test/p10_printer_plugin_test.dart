import 'package:flutter_test/flutter_test.dart';
import 'package:p10_printer_plugin/p10_printer_plugin.dart';
import 'package:p10_printer_plugin/p10_printer_plugin_platform_interface.dart';
import 'package:p10_printer_plugin/p10_printer_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockP10PrinterPluginPlatform
    with MockPlatformInterfaceMixin
    implements P10PrinterPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final P10PrinterPluginPlatform initialPlatform = P10PrinterPluginPlatform.instance;

  test('$MethodChannelP10PrinterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelP10PrinterPlugin>());
  });

  test('getPlatformVersion', () async {
    P10PrinterPlugin p10PrinterPlugin = P10PrinterPlugin();
    MockP10PrinterPluginPlatform fakePlatform = MockP10PrinterPluginPlatform();
    P10PrinterPluginPlatform.instance = fakePlatform;

    expect(await p10PrinterPlugin.getPlatformVersion(), '42');
  });
}
