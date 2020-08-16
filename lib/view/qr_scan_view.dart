import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_qr_code/platform_interface.dart';
import 'package:flutter_qr_code/qr_scan_controller.dart';

const String _VIEW_TYPE_NAME = 'com.wshunli.flutter/qr_code_scan';

class QrScanView extends StatefulWidget {
  final QrScanCreatedCallback onCreated;
  final QRScanSuccessCallback onScanQRCodeSuccess;
  final QRScanBrightnessChangedCallback onCameraAmbientBrightnessChanged;
  final QRScanOpenCameraErrorCallback onScanQRCodeOpenCameraError;

  QrScanView({
    Key key,
    @required this.onCreated,
    @required this.onScanQRCodeSuccess,
    @required this.onCameraAmbientBrightnessChanged,
    @required this.onScanQRCodeOpenCameraError,
  }) : super(key: key);

  @override
  _QrScanViewState createState() => _QrScanViewState();
}

class _QrScanViewState extends State<QrScanView> {
  @override
  Widget build(BuildContext context) {
    return _buildNativeView();
  }

  // 构建原生控件
  _buildNativeView() {
    if (Platform.isAndroid) {
      return AndroidView(
        viewType: _VIEW_TYPE_NAME,
        onPlatformViewCreated: _onQrScanViewCreated,
        creationParams: <String, dynamic>{},
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return UiKitView(
        viewType: _VIEW_TYPE_NAME,
        onPlatformViewCreated: _onQrScanViewCreated,
        creationParams: <String, dynamic>{},
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
  }

  static const MethodChannel _channel =
      const MethodChannel('com.wshunli.flutter/qr_code_scan');

  // 扫码页面创建完成
  Future<void> _onQrScanViewCreated(id) async {
    QrScanController controller = new QrScanController(_channel);
    if (widget.onCreated != null) {
      widget.onCreated(controller);
    }
    _channel.setMethodCallHandler(_onMethodCall);
  }

  // 扫码结果回调
  Future<void> _onMethodCall(MethodCall call) async {
    switch (call.method) {
      case "onScanQRCodeSuccess":
        widget.onScanQRCodeSuccess(call.arguments);
        break;
      case "onCameraAmbientBrightnessChanged":
        widget.onCameraAmbientBrightnessChanged(call.arguments);
        break;
      case "onScanQRCodeOpenCameraError":
        widget.onScanQRCodeOpenCameraError();
        break;
      default:
        print("QrScanView: [onMethodCall] ${call.method} not found.");
    }
  }
}
