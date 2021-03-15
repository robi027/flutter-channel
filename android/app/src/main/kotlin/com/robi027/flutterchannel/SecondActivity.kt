package com.robi027.flutterchannel

import android.os.Bundle
import android.util.Log
import io.flutter.app.FlutterActivity
import kotlinx.android.synthetic.main.activity_second.*

class SecondActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)
        Log.i(this.javaClass.simpleName, "[SecondActivity]: ${intent.getStringExtra("title")}")
        tvTitle.text = intent.getStringExtra("title")

        btSendToNative.setOnClickListener {
            intent.putExtra("name", "From Native")
            setResult(0, intent)
            finish()
        }
    }
}