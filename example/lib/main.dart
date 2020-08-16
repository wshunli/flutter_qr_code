import 'package:flutter/material.dart';

import 'package:flutter_qr_code/qr_scan_view.dart';
import 'package:flutter_qr_code/qr_scan_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  QrScanController _controller;
  String _qrResult = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QrCodePlugin'),
          actions: [
            PopupMenuButton<int>(
              offset: Offset(0, kToolbarHeight),
              icon: Icon(Icons.more_vert),
              onSelected: (int value) async {
                switch (value) {
                  case 0:
                    String url = "https://github.com/wshunli/flutter_qr_code";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                PopupMenuItem(
                  child: Text("关于"),
                  value: 0,
                ),
              ],
            ),
          ],
        ),
        body: Stack(
          children: [
            QrScanView(
              onCreated: (QrScanController controller) {
                _controller = controller;
                // 开始识别
                controller.startCamera();
                controller.startSpotAndShowRect();
              },
              onScanQRCodeSuccess: (String result) {
                print("onScanQRCodeSuccess: $result");
                setState(() {
                  _qrResult = result;
                });
                _controller.startSpot();
              },
              onCameraAmbientBrightnessChanged: (bool isDark) {
                // print("onCameraAmbientBrightnessChanged: $isDark");
              },
              onScanQRCodeOpenCameraError: () {
                print("onScanQRCodeOpenCameraError: ");
              },
            ),
            Container(
              height: double.infinity,
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "扫描结果：$_qrResult",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        child: Text(
                          "开始识别",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _controller.startSpot(),
                        color: Colors.deepOrange,
                      ),
                      RaisedButton(
                        child: Text(
                          "暂停识别",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _controller.stopSpot(),
                        color: Colors.deepOrange,
                      ),
                      RaisedButton(
                        child: Text(
                          "显示扫描框",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _controller.showScanRect(),
                        color: Colors.deepOrange,
                      ),
                      RaisedButton(
                        child: Text(
                          "隐藏扫描框",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _controller.hiddenScanRect(),
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        child: Text(
                          "开始识别显示扫描框",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _controller.startSpotAndShowRect(),
                        color: Colors.deepOrange,
                      ),
                      RaisedButton(
                        child: Text(
                          "暂停识别隐藏扫描框",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _controller.stopSpotAndHiddenRect(),
                        color: Colors.deepOrange,
                      ),
                      RaisedButton(
                        child: Text(
                          "相册选取",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          final pickedFile = await ImagePicker()
                              .getImage(source: ImageSource.gallery);
                          _controller.decodeQRCode(pickedFile.path);
                        },
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                        child: Text(
                          "开始预览",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _controller.startCamera(),
                        color: Colors.deepOrange,
                      ),
                      RaisedButton(
                        child: Text(
                          "暂停预览",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _controller.stopCamera(),
                        color: Colors.deepOrange,
                      ),
                      RaisedButton(
                        child: Text(
                          "打开闪光灯",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _controller.openFlashlight(),
                        color: Colors.deepOrange,
                      ),
                      RaisedButton(
                        child: Text(
                          "关闭闪光灯",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => _controller.closeFlashlight(),
                        color: Colors.deepOrange,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
