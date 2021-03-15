package com.robi027.flutterchannel

import android.content.Intent
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val platform: String = "com.robi027.flutterchannel/native"
    private lateinit var result: MethodChannel.Result

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, platform)
                .setMethodCallHandler { call, result ->
                    this.result = result
                    when (call.method) {
                        "TONATIVE" -> {
                            Log.i(this.javaClass.simpleName, "[ConfigureFlutterEngine]: ${call.arguments}")
                            val intent = Intent(this, SecondActivity::class.java)
                            intent.putExtra("title", call.arguments as String)
                            startActivityForResult(intent, 0)
                        }
                        else -> {
                        }
                    }
                }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        result.success(data?.getStringExtra("name"))
    }
}
