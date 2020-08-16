package com.wshunli.flutter.flutter_qr_code.custom

import android.content.Context
import android.util.AttributeSet
import android.view.LayoutInflater
import android.widget.FrameLayout
import com.wshunli.flutter.flutter_qr_code.R


/**
 * author : wshunli
 * email : wshunli@qq.com
 * date : 2020/8/16 11:06
 * description ： 扫码布局
 */
class ZXingLayout : FrameLayout {

    constructor(context: Context) : super(context) {
        initView(context)
    }

    constructor(context: Context, attrs: AttributeSet?) : super(context, attrs) {
        initView(context)
    }

    constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int) : super(context, attrs, defStyleAttr) {
        initView(context)
    }

    private fun initView(context: Context) {
        LayoutInflater.from(context).inflate(R.layout.view_qr_scan, this, true)
    }
}