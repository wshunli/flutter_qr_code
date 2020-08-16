import 'package:flutter/services.dart';

class QrScanController {
  MethodChannel _channel;

  QrScanController(this._channel);

  // 显示扫描框
  void showScanRect() {
    _channel.invokeMethod("showScanRect");
  }

  // 隐藏扫描框
  void hiddenScanRect() {
    _channel.invokeMethod("hiddenScanRect");
  }

  // 打开后置摄像头开始预览，但是并未开始识别
  void startCamera() {
    _channel.invokeMethod("startCamera");
  }

  // 关闭摄像头预览，并且隐藏扫描框
  void stopCamera() {
    _channel.invokeMethod("stopCamera");
  }

  // 开始识别
  void startSpot() {
    _channel.invokeMethod("startSpot");
  }

  // 显示扫描框，并开始识别
  void startSpotAndShowRect() {
    _channel.invokeMethod("startSpotAndShowRect");
  }

  // 停止识别
  void stopSpot() {
    _channel.invokeMethod("stopSpot");
  }

  // 停止识别，并且隐藏扫描框
  void stopSpotAndHiddenRect() {
    _channel.invokeMethod("stopSpotAndHiddenRect");
  }

  // 打开闪光灯
  void openFlashlight() {
    _channel.invokeMethod("openFlashlight");
  }

  // 关闭闪光灯
  void closeFlashlight() {
    _channel.invokeMethod("closeFlashlight");
  }

  // 解析本地图片二维码。返回二维码图片里的内容 或 null
  void decodeQRCode(String picturePath) {
    _channel.invokeMethod("decodeQRCode", picturePath);
  }
}
