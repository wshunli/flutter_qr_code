import 'package:flutter/material.dart';

import 'package:flutter_qr_code/qr_scan_controller.dart';
import 'package:flutter_qr_code/view/qr_scan_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: QrScanView(
            onCreated: (QrScanController controller) {},
            onScanQRCodeSuccess: (String result) {
              print("onScanQRCodeSuccess: $result");
            },
            onCameraAmbientBrightnessChanged: (bool isDark) {
              // print("onCameraAmbientBrightnessChanged: $isDark");
            },
            onScanQRCodeOpenCameraError: () {
              print("onScanQRCodeOpenCameraError: ");
            },
          ),
        ),
      ),
    );
  }
}
