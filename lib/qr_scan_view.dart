import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_qr_code/qr_scan_controller.dart';

const String viewTypeString = 'com.wshunli.qr/qr_scan_view';

typedef void QrScanViewCreatedCallback(QrScanViewController controller);

class QrScanView extends StatefulWidget {
  final QrScanViewCreatedCallback onCreated;
  final x;
  final y;
  final width;
  final height;

  QrScanView({
    Key key,
    @required this.onCreated,
    @required this.x,
    @required this.y,
    @required this.width,
    @required this.height,
  });

  @override
  _QrScanViewState createState() => _QrScanViewState();
}

class _QrScanViewState extends State<QrScanView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: _nativeView(),
      onTapDown: (TapDownDetails details) {
        print("onTapDown: ${details.globalPosition}");
      },
    );
  }

  _nativeView() {
    if (Platform.isAndroid) {
      return AndroidView(
        viewType: viewTypeString,
        onPlatformViewCreated: onQrScanViewCreated,
        creationParams: <String, dynamic>{
          "x": widget.x,
          "y": widget.y,
          "width": widget.width,
          "height": widget.height,
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return UiKitView(
        viewType: viewTypeString,
        onPlatformViewCreated: onQrScanViewCreated,
        creationParams: <String, dynamic>{
          "x": widget.x,
          "y": widget.y,
          "width": widget.width,
          "height": widget.height,
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
  }

  Future<void> onQrScanViewCreated(id) async {
    if (widget.onCreated == null) {
      return;
    }
    widget.onCreated(new QrScanViewController.init(id));
  }
}
