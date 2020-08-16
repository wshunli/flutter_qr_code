package com.wshunli.flutter.flutter_qr_code.factory

import android.content.Context
import com.wshunli.flutter.flutter_qr_code.view.QrScanView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

/**
 * author : wshunli
 * email : wshunli@qq.com
 * date : 2020/8/2 13:41
 * description ： 扫码控件工厂控件
 */

class QrScanViewFactory(private val messenger: BinaryMessenger)
    : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    @Suppress("UNCHECKED_CAST")
    override fun create(context: Context, id: Int, args: Any): PlatformView {
        val params = args as Map<String, Any>
        return QrScanView(context, messenger, params)
    }

}