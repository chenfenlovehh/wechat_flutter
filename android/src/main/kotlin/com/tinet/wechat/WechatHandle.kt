package com.tinet.wechat

import android.content.Context
import androidx.annotation.NonNull
import com.tencent.mm.opensdk.modelbiz.WXLaunchMiniProgram
import com.tencent.mm.opensdk.openapi.IWXAPI
import com.tencent.mm.opensdk.openapi.WXAPIFactory
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * 微信相关分享中心处理
 * @author: liuzeren
 * @date: 2023/3/15
 */
class WechatHandle constructor(private val context: Context) {

    companion object {

        /**
         * 打开微信小程序
         */
        private const val OPEN_MINIPROGRAM = "openMiniProgram"
    }

    private var api: IWXAPI? = null

    fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        if (call.method == OPEN_MINIPROGRAM) {
            var appId = call.argument<String?>("appId") ?: ""
            var userName = call.argument<String?>("userName") ?: ""
            var path = call.argument<String?>("path") ?: ""
            var miniProgramType = call.argument<Int?>("miniprogramType")
                ?: WXLaunchMiniProgram.Req.MINIPTOGRAM_TYPE_RELEASE

            openMiniProgram(appId, userName, path, miniProgramType)

            result.success(null)
        }else{
            result.notImplemented()
        }
    }

    /**
     * 打开小程序
     * [appId] app的appId，对应于开放平台APP的id
     * [userName] 小程序的userName
     * [path] 打开小程序的路径
     * [miniprogramType] 模式 ，对应于[WXLaunchMiniProgram.Req]中的三种模式
     */
    private fun openMiniProgram(
        appId: String,
        userName: String,
        path: String,
        miniProgramType: Int = WXLaunchMiniProgram.Req.MINIPTOGRAM_TYPE_RELEASE
    ) {
        if (api == null) {
            api = WXAPIFactory.createWXAPI(context, appId)
        }

        val request = WXLaunchMiniProgram.Req().apply {
            this.userName = userName
            this.path = path
            this.miniprogramType = miniProgramType
        }

        api?.sendReq(request)
    }

}