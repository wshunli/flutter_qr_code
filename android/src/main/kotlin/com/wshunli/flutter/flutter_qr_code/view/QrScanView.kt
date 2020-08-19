package com.wshunli.flutter.flutter_qr_code.view

import android.app.Activity
import android.app.Application
import android.content.Context
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Button
import cn.bingoogolapple.qrcode.core.QRCodeView
import cn.bingoogolapple.qrcode.zxing.ZXingView
import com.wshunli.flutter.flutter_qr_code.R
import com.wshunli.flutter.flutter_qr_code.custom.ZXingLayout
import com.wshunli.flutter.flutter_qr_code.handler.QrScanMethodHandler
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView


/**
 * author : wshunli
 * email : wshunli@qq.com
 * date : 2020/8/2 13:24
 * description ： 扫码控件
 */
class QrScanView(context: Context, messenger: BinaryMessenger, params: Map<String, Any>)
    : PlatformView, QRCodeView.Delegate, Application.ActivityLifecycleCallbacks {

    companion object {
        const val TAG = "QrScanView"
        private const val METHOD_CHANNEL = "com.wshunli.flutter/qr_code_scan"

    }

    private val mQrScanLayout: ZXingLayout = ZXingLayout(context)
    private val mQrScanView: ZXingView? = mQrScanLayout.findViewById(R.id.zxingview)
    private val mMethodHandler: MethodChannel = MethodChannel(messenger, METHOD_CHANNEL)

    init {
        mQrScanView?.setDelegate(this)
        val application = context.applicationContext as Application
        application.registerActivityLifecycleCallbacks(this)
        mMethodHandler.setMethodCallHandler(QrScanMethodHandler(messenger, mQrScanView))
    }

    override fun getView(): View {
        return mQrScanLayout
    }

    override fun dispose() {
        mQrScanView?.stopSpot()
        mQrScanView?.onDestroy()
    }

    /**
     * 处理扫描结果
     * @param result 摄像头扫码时只要回调了该方法 result 就一定有值，不会为 null。
     * 解析本地图片或 Bitmap 时 result 可能为 null
     */
    override fun onScanQRCodeSuccess(result: String?) {
        mMethodHandler.invokeMethod("onScanQRCodeSuccess", result)
    }

    /**
     * 摄像头环境亮度发生变化
     * @param isDark 是否变暗
     */
    override fun onCameraAmbientBrightnessChanged(isDark: Boolean) {
        mMethodHandler.invokeMethod("onCameraAmbientBrightnessChanged", isDark)
    }

    /**
     * 处理打开相机出错
     */
    override fun onScanQRCodeOpenCameraError() {
        mMethodHandler.invokeMethod("onScanQRCodeOpenCameraError", null)
    }

    override fun onActivityCreated(activity: Activity?, savedInstanceState: Bundle?) {
    }

    override fun onActivityStarted(activity: Activity?) {
        mQrScanView?.startCamera()
    }

    override fun onActivityResumed(activity: Activity?) {
        mQrScanView?.startSpotAndShowRect()

    }

    override fun onActivityPaused(activity: Activity?) {

    }

    override fun onActivityStopped(activity: Activity?) {
        // mQrScanView?.stopCamera()
    }

    override fun onActivityDestroyed(activity: Activity?) {
        // mQrScanView?.onDestroy()
    }

    override fun onActivitySaveInstanceState(activity: Activity?, outState: Bundle?) {

    }
}