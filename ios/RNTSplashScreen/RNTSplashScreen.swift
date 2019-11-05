
import UIKit

public class RNTSplashScreen : NSObject {

    // 监听 js 错误，如果 js 报错，则关掉开屏
    static var hasJsLoadErrorWatcher = false

    // 是否正在等待，加载默认图需要这个标识
    static var waiting = false

    // RN 提供的根视图
    static var rootView: RCTRootView? = nil

    // 加载默认的 Launch Image
    @objc public static func show(rootView: RCTRootView) {
        if !hasJsLoadErrorWatcher {

            NotificationCenter.default.addObserver(self, selector: #selector(RNTSplashScreen.onJsLoadError), name: NSNotification.Name.RCTJavaScriptDidFailToLoad, object: nil)

            hasJsLoadErrorWatcher = true

        }

        RNTSplashScreen.rootView = rootView

        // 开始等待
        waiting = true
        // 线程会停在这，一直等到 js 调用 hide 才会结束此方法
        while waiting {
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.1))
        }

    }

    // 指定开屏图片
    @objc public static func show(rootView: RCTRootView, image: String) {

        guard let image = UIImage(named: image) else {
            return
        }

        let imageView = UIImageView()

        imageView.frame.origin = CGPoint.zero
        imageView.frame.size = rootView.frame.size
        imageView.image = image

        rootView.loadingView = imageView

        RNTSplashScreen.rootView = rootView

    }

    @objc public static func getSafeArea() -> UIEdgeInsets {
        if #available(iOS 11.0, *) {
            guard let view = RNTSplashScreen.rootView else {
                return UIEdgeInsets.zero
            }
            return view.safeAreaInsets
        } else {
            return UIEdgeInsets.zero
        }
    }

    @objc public static func hide() {
        DispatchQueue.main.async {
            // 默认图
            if waiting {
                waiting = false
                if hasJsLoadErrorWatcher {
                    NotificationCenter.default.removeObserver(self, name: NSNotification.Name.RCTJavaScriptDidFailToLoad, object: nil)
                    hasJsLoadErrorWatcher = false
                }
            }
            // 自定义图片
            else if let view = rootView {
                view.loadingView?.removeFromSuperview()
                view.loadingView = nil
            }
            RNTSplashScreen.rootView = nil
        }
    }

    @objc private static func onJsLoadError() {
        hide()
    }

}
