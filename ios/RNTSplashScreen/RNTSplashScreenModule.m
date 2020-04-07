#import "RNTSplashScreenModule.h"
#import "react_native_pure_splash_screen-Swift.h"

@implementation RNTSplashScreenModule

RCT_EXPORT_MODULE(RNTSplashScreen);

+ (void)show:(RCTRootView *)rootView {
    [RNTSplashScreen showWithRootView:rootView];
}

+ (void)show:(RCTRootView *)rootView image:(NSString *)image {
    [RNTSplashScreen showWithRootView:rootView image:image];
}

+ (void)hide {
    [RNTSplashScreen hide];
}

RCT_EXPORT_METHOD(hide) {
    [RNTSplashScreenModule hide];
}

@end
