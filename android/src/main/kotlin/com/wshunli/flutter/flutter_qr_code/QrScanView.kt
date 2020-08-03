package com.wshunli.flutter.flutter_qr_code

import android.app.Activity
import android.app.Application
import android.content.Context
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import cn.bingoogolapple.qrcode.core.QRCodeView
import cn.bingoogolapple.qrcode.zxing.ZXingView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView


/**
 * author : wshunli
 * email : wshunli@qq.com
 * date : 2020/8/2 13:24
 * description ： 扫码页面
 */
class QrScanView(private val context: Context,
                 private val messenger: BinaryMessenger,
                 private val id: Int?,
                 private val params: Map<String, Any>?) : PlatformView, QRCodeView.Delegate {

    companion object {
        const val TAG = "QrScanView"
    }

    var qrScanView: ZXingView? = null

    init {
        val application = context.applicationContext as Application
        application.registerActivityLifecycleCallbacks(object : Application.ActivityLifecycleCallbacks {

            override fun onActivityCreated(activity: Activity?, savedInstanceState: Bundle?) {
            }

            override fun onActivityStarted(activity: Activity?) {
                qrScanView?.startCamera()
            }

            override fun onActivityResumed(activity: Activity?) {

            }

            override fun onActivityPaused(activity: Activity?) {

            }

            override fun onActivityStopped(activity: Activity?) {
                qrScanView?.stopCamera()
            }

            override fun onActivityDestroyed(activity: Activity?) {
                qrScanView?.onDestroy()
            }

            override fun onActivitySaveInstanceState(activity: Activity?, outState: Bundle?) {

            }

        })
    }

    override fun getView(): View {
        val viewGroup = LayoutInflater.from(context).inflate(R.layout.view_qr_scan, null) as ViewGroup
        qrScanView = viewGroup.findViewById(R.id.zxingview)
        qrScanView?.setDelegate(this)
        qrScanView?.startCamera()
        return viewGroup
    }

    override fun dispose() {
        qrScanView?.onDestroy()
    }

    override fun onScanQRCodeSuccess(result: String?) {
        Log.e(TAG, "onScanQRCodeSuccess: $result");
    }

    override fun onCameraAmbientBrightnessChanged(isDark: Boolean) {
        Log.e(TAG, "isDark: $isDark");
    }

    override fun onScanQRCodeOpenCameraError() {
        Log.e(TAG, "打开相机出错");
    }
}