package com.wshunli.flutter.flutter_qr_code

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

/**
 * author : wshunli
 * email : wshunli@qq.com
 * date : 2020/8/2 13:41
 * description ：
 */
class QrScanViewFactory(private val messenger: BinaryMessenger)
    : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context, id: Int, args: Any?): PlatformView {
        val params = args?.let { args as Map<String, Any> }
        return QrScanView(context, messenger, id, params)

    }
}