import 'package:flutter/services.dart';

class QrScanViewController {
  MethodChannel _channel;

  QrScanViewController.init(int id) {
    _channel = new MethodChannel('qr_scan_view_$id');
  }

  Future<void> reloadView() async {
    return _channel.invokeMethod('reloadView');
  }
}
