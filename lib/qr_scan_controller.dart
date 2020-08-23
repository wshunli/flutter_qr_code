import 'package:flutter/services.dart';

class QrScanController {
  MethodChannel _channel;

  QrScanController(this._channel);

  /// 显示扫描框
  Future<void> showScanRect() async {
    _channel.invokeMethod("showScanRect");
  }

  /// 隐藏扫描框
  Future<void> hiddenScanRect() async {
    _channel.invokeMethod("hiddenScanRect");
  }

  /// 打开后置摄像头开始预览，但是并未开始识别
  Future<void> startCamera() async {
    _channel.invokeMethod("startCamera");
  }

  /// 关闭摄像头预览，并且隐藏扫描框
  Future<void> stopCamera() async {
    _channel.invokeMethod("stopCamera");
  }

  /// 开始识别
  Future<void> startSpot() async {
    _channel.invokeMethod("startSpot");
  }

  /// 显示扫描框，并开始识别
  Future<void> startSpotAndShowRect() async {
    _channel.invokeMethod("startSpotAndShowRect");
  }

  /// 停止识别
  Future<void> stopSpot() async {
    _channel.invokeMethod("stopSpot");
  }

  /// 停止识别，并且隐藏扫描框
  Future<void> stopSpotAndHiddenRect() async {
    _channel.invokeMethod("stopSpotAndHiddenRect");
  }

  /// 打开闪光灯
  Future<void> openFlashlight() async {
    _channel.invokeMethod("openFlashlight");
  }

  /// 关闭闪光灯
  Future<void> closeFlashlight() async {
    _channel.invokeMethod("closeFlashlight");
  }

  /// 解析本地图片二维码。返回二维码图片里的内容 或 null
  Future<void> decodeQRCode(String picturePath) async {
    _channel.invokeMethod("decodeQRCode", picturePath);
  }
}
