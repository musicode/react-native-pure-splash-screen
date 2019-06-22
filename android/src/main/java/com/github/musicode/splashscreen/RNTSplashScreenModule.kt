package com.github.musicode.splashscreen

import android.app.Activity
import android.app.Dialog
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import java.lang.ref.WeakReference

class RNTSplashScreenModule(private val reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "RNTSplashScreen"
    }

    @ReactMethod
    fun show() {
        show(currentActivity!!)
    }

    @ReactMethod
    fun hide() {

        val currentActivity = activity?.get() ?: return

        currentActivity.runOnUiThread {
            dialog?.get()?.let {
                if (it.isShowing) {
                    it.dismiss()
                }
                activity = null
                dialog = null
            }
        }

    }


    companion object {

        private var activity: WeakReference<Activity>? = null

        private var dialog: WeakReference<Dialog>? = null

        fun show(activity: Activity) {
            activity.runOnUiThread {
                if (!activity.isFinishing) {

                    val dialog = Dialog(activity, R.style.splash_screen_default)
                    dialog.setContentView(R.layout.splash_screen_default)
                    dialog.setCancelable(false)

                    if (!dialog.isShowing) {
                        dialog.show()
                    }

                    RNTSplashScreenModule.activity = WeakReference(activity)
                    RNTSplashScreenModule.dialog = WeakReference(dialog)

                }
            }
        }

    }

}