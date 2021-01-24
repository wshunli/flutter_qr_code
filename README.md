# flutter_qr_code

[![Version](https://img.shields.io/pub/v/flutter_qr_code.svg)](https://pub.dev/packages/flutter_qr_code) 
[![GitHub license](https://img.shields.io/github/license/wshunli/flutter_qr_code.svg)](https://github.com/wshunli/flutter_qr_code/blob/master/LICENSE)

A new Flutter QrCode plugin.

**Important: Currently only supports Android platform, welcome to submit PR.**

## Installing 

You should add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_qr_code: ^0.0.2+2
```

More documentation : [https://pub.dev/packages/flutter_qr_code/install](https://pub.dev/packages/flutter_qr_code/install)

## Getting Started

To start,  import the package in your code:

```dart
import 'package:flutter_qr_code/platform_interface.dart';
import 'package:flutter_qr_code/qr_scan_controller.dart';
import 'package:flutter_qr_code/qr_scan_view.dart';
```

Just like using a Flutter widget:

```dart
QrScanView(
    // QrScanView Created
    onCreated: (QrScanController controller) {
        _controller = controller;
        controller.startCamera();
        controller.startSpotAndShowRect();
    },
    // The QR code is successfully recognized
    onScanQRCodeSuccess: (String result) {
        print("onScanQRCodeSuccess: $result");
        _controller.startSpot();
    },
    // The environment brightness changes, 
    // you can change the flash state
    onCameraAmbientBrightnessChanged: (bool isDark) {
        print("onCameraAmbientBrightnessChanged: $isDark");
    },
    // When recognizing the QR code, an error occurred
    onScanQRCodeOpenCameraError: () {
        print("onScanQRCodeOpenCameraError: ");
    },
)
```

## Screenshot

![](./screenshot.png)

## QrScanController  Method

1、Camera preview 

```dart
controller.startCamera()
controller.stopCamera()
```

2、Identify the QR code

```dart
controller.startSpot()
controller.stopSpot()
```

3、Scan grid

```dart
controller.showScanRect()
controller.hiddenScanRect()

// show Scan grid And Start Identify the QR code
controller.startSpotAndShowRect()
// hide Scan grid And Stop Identify the QR code
controller.stopSpotAndHiddenRect()
```

4、Flashlight

```dart
controller.openFlashlight()
controller.closeFlashlight()
```

5、decode local image

```dart
controller.decodeQRCode(local_img_path)
```

For more information, see the example.

## Credits

Android: https://github.com/bingoogolapple/BGAQRCode-Android


## License

    Copyright 2020 wshunli
    
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    
       http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
