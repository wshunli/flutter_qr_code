package com.wshunli.flutter.flutter_qr_code

import android.util.Log
import androidx.annotation.NonNull
import com.wshunli.flutter.flutter_qr_code.factory.QrScanViewFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.PluginRegistry

/** FlutterQrCodePlugin */
public class FlutterQrCodePlugin : FlutterPlugin, ActivityAware {

    companion object {
        private const val TAG = "FlutterQrCodePlugin"
        private const val VIEW_TYPE_SCAN = "com.wshunli.flutter/qr_code_scan"

        @JvmStatic
        fun registerWith(registrar: PluginRegistry.Registrar) {
            val plugin = FlutterQrCodePlugin()
            plugin.setup(registrar.messenger())
        }
    }

    private var mBinding: FlutterPlugin.FlutterPluginBinding? = null

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        this.mBinding = binding
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        this.mBinding = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        mBinding?.let {
            setup(it.binaryMessenger)
        }
    }

    override fun onDetachedFromActivity() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    // 注册扫码控件
    private fun setup(messenger: BinaryMessenger) {
        Log.i(TAG, "setup: FlutterQrCodePlugin")
        mBinding?.platformViewRegistry?.registerViewFactory(VIEW_TYPE_SCAN, QrScanViewFactory(messenger))
    }


}
