import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:p10_printer_plugin/p10_printer_plugin.dart';
import 'package:screenshot/screenshot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _p10PrinterPlugin = P10PrinterPlugin();

  void printImage() async {
    final controller = ScreenshotController();
    Uint8List byte = await controller.captureFromWidget(_buildPrintTicket1());
    int? value = await _p10PrinterPlugin.printPicture(byte);
    Fluttertoast.showToast(
        msg: "Value: $value",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    int? value = await _p10PrinterPlugin.getPrinterStatus();
                    Fluttertoast.showToast(
                        msg: "Value: $value",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black45,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child: const Text("Get status")),
              ElevatedButton(
                  onPressed: () {
                    printImage();
                  },
                  child: const Text("Print image")),
            ],
          ),
        ),
      ),
    );
  }
}

Container _buildPrintTicket1() {
  return Container(
    color: Colors.white,
    width: 200,
    height: 400,
    child: Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "VÉ XE",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 32, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            'An',
            style: TextStyle(color: Colors.black),
            // style: TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "Tel: 0916767869",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        // Divider(height: 1, color: Colors.black),
        const Text(
          "--------------------------------------------------------------------------------",
          style: TextStyle(fontSize: 20, color: Colors.black),
          maxLines: 1,
        ),
        const SizedBox(
          height: 8,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Từ điểm: Bến xe Bãi cháy",
            // style: TextStyle(fontSize: 16),
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Đến điểm: Đông Triều",
            // style: TextStyle(fontSize: 16),
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "--------------------------------------------------------------------------------",
          style: TextStyle(fontSize: 20, color: Colors.black),
          maxLines: 1,
        ),

        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "GIÁ VÉ",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Expanded(child: Container()),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "10.000đ",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "TIỀN HÀNG",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Expanded(child: Container()),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "50.000đ",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),

        const Text(
          "========================================================================",
          style: TextStyle(fontSize: 20, color: Colors.black),
          maxLines: 1,
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Xin cảm ơn!",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "25/04/2022 18:32",
          //style: TextStyle(fontWeight: FontWeight.bold),
          style: TextStyle(color: Colors.black),
        )
      ],
    ),
  );
}
