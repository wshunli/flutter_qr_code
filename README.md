# flutter_qr_code

[![Version](https://img.shields.io/pub/v/flutter_qr_code.svg)](https://pub.dev/packages/flutter_qr_code) 
[![GitHub license](https://img.shields.io/github/license/wshunli/flutter_qr_code.svg)](https://github.com/wshunli/flutter_qr_code/blob/master/LICENSE)

A new Flutter QrCode plugin.

## Getting Started


```dart
import 'package:flutter_qr_code/qr_scan_view.dart';
import 'package:flutter_qr_code/qr_scan_controller.dart';
```

Just like using a fluent widget:

```dart
QrScanView(
    onCreated: (QrScanController controller) {
    controller.startCamera();
    controller.startSpotAndShowRect();
    },
    onScanQRCodeSuccess: (String result) {
    print("onScanQRCodeSuccess: $result");
    _controller.startSpot();
    },
    onCameraAmbientBrightnessChanged: (bool isDark) {
    print("onCameraAmbientBrightnessChanged: $isDark");
    },
    onScanQRCodeOpenCameraError: () {
    print("onScanQRCodeOpenCameraError: ");
    },
)
```

## Screenshot

![](https://raw.githubusercontent.com/wshunli/flutter_qr_code/master/screenshot.jpg)

More documentation coming soon.

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
