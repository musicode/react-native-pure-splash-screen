package com.github.musicode.splashscreen

import android.app.Activity
import android.app.Dialog
import java.lang.ref.WeakReference
import android.os.Build
import com.facebook.react.bridge.*


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
                // getSafeArea 应先于 hide 调用
                activity = null
                dialog = null
            }
        }

    }

    @ReactMethod
    fun getSafeArea(promise: Promise) {

        val map = Arguments.createMap()
        map.putInt("top", 0)
        map.putInt("bottom", 0)
        map.putInt("left", 0)
        map.putInt("right", 0)

        val currentActivity = activity?.get()
        if (currentActivity == null) {
            promise.resolve(map)
            return
        }

        currentActivity.runOnUiThread {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                val displayCutout = currentActivity.window.decorView.rootWindowInsets?.displayCutout
                if (displayCutout != null) {
                    map.putInt("top", displayCutout.safeInsetTop)
                    map.putInt("bottom", displayCutout.safeInsetBottom)
                    map.putInt("left", displayCutout.safeInsetLeft)
                    map.putInt("right", displayCutout.safeInsetRight)
                }
            }
            promise.resolve(map)
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