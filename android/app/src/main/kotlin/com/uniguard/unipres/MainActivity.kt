package com.uniguard.unipres

import com.uniguard.unipres.utils.Utils
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "device/info"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { methodCall, result ->
            when (methodCall.method) {
                    "getDeviceId" -> {
                    val mId = Utils.getAndroidId(applicationContext)
                    result.success(mId)
                }
                else -> result.notImplemented()
            }
        }
    }
}
