package com.example.p10_printer_plugin;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;

import androidx.annotation.NonNull;

import com.pos.sdk.printer.POIPrinterManager;
import com.pos.sdk.printer.models.BitmapPrintLine;
import com.pos.sdk.printer.models.PrintLine;

import java.io.ByteArrayInputStream;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** P10PrinterPlugin */
public class P10PrinterPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  POIPrinterManager printerManager;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "p10_printer_plugin");
    channel.setMethodCallHandler(this);
      printerManager = new POIPrinterManager(flutterPluginBinding.getApplicationContext());
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    try {
      if (call.method.equals("getPrinterStatus")) {
//        printerManager.open();
        int state = printerManager.getPrinterState();
        result.success(state);
      } else if (call.method.equals("lineWrap")) {
        int lines = call.argument("lines");
        printerManager.lineWrap(lines);
        printerManager.open();
        POIPrinterManager.IPrinterListener listener = new
                POIPrinterManager.IPrinterListener() {
                  @Override
                  public void onStart() {}
                  @Override
                  public void onFinish() {
                    printerManager.close();
                    int state = printerManager.getPrinterState();
                    result.success(state);
                  }
                  @Override
                  public void onError(int code, String msg) {
                    Log.e("POIPrinterManager", "code: " + code + "msg: " + msg);
                    printerManager.close();
                    int state = printerManager.getPrinterState();
                    result.success(state);
                  }
                };
        printerManager.beginPrint(listener);
        int state = printerManager.getPrinterState();
        result.success(state);
      } else if (call.method.equals("printPicture")) {
        printerManager.open();
        byte[] data = call.argument("picture");
        Bitmap bitmap = BitmapFactory.decodeStream(new ByteArrayInputStream(data));
        printerManager.addPrintLine(new BitmapPrintLine(bitmap, PrintLine.CENTER));
        POIPrinterManager.IPrinterListener listener = new
                POIPrinterManager.IPrinterListener() {
                  @Override
                  public void onStart() {}
                  @Override
                  public void onFinish() {
                    printerManager.close();
                    int state = printerManager.getPrinterState();
                    result.success(state);
                  }
                  @Override
                  public void onError(int code, String msg) {
                    Log.e("POIPrinterManager", "code: " + code + "msg: " + msg);
                    printerManager.close();
                    int state = printerManager.getPrinterState();
                    result.success(state);
                  }
                };
        printerManager.beginPrint(listener);
      }
      else {
        result.notImplemented();
      }
    } catch (Exception e) {
      Log.e("P10_printer_plugin",e.getMessage());
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
//    printerManager.close();
    channel.setMethodCallHandler(null);
  }
}
