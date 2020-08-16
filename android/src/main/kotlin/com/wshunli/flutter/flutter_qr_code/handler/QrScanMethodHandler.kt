package com.wshunli.flutter.flutter_qr_code.handler

import android.util.Log
import cn.bingoogolapple.qrcode.zxing.ZXingView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * author : wshunli
 * email : wshunli@qq.com
 * date : 2020/8/16 11:00
 * description ： 原生方法处理
 */
class QrScanMethodHandler(
        messenger: BinaryMessenger,
        private val qrScanView: ZXingView?
) : MethodChannel.MethodCallHandler {

    companion object {
        private const val TAG = "QrScanMethodHandler"
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        val method = call.method
        Log.i(TAG, "onMethodCall: $method")
        when (call.method) {
            // 显示扫描框
            "showScanRect" -> qrScanView?.showScanRect()
            // 隐藏扫描框
            "hiddenScanRect" -> qrScanView?.hiddenScanRect()
            // 打开后置摄像头开始预览，但是并未开始识别
            "startCamera" -> qrScanView?.startCamera()
            // 关闭摄像头预览，并且隐藏扫描框
            "stopCamera" -> qrScanView?.stopCamera()
            // 开始识别
            "startSpot" -> qrScanView?.startSpot()
            // 显示扫描框，并开始识别
            "startSpotAndShowRect" -> qrScanView?.startSpotAndShowRect()
            // 停止识别
            "stopSpot" -> qrScanView?.stopSpot()
            // 停止识别，并且隐藏扫描框
            "stopSpotAndHiddenRect" -> qrScanView?.stopSpotAndHiddenRect()
            // 打开闪光灯
            "openFlashlight" -> qrScanView?.openFlashlight()
            // 关闭闪光灯
            "closeFlashlight" -> qrScanView?.closeFlashlight()
            // 解析本地图片二维码。返回二维码图片里的内容 或 null
            "decodeQRCode" -> qrScanView?.decodeQRCode(call.arguments as String)
            else -> {
                Log.e(TAG, "onMethodCall: $method not found.")
            }
        }
    }
}