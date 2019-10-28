
#import "RNTSplashScreenModule.h"
#import "RNTSplashScreen-Swift.h"

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

RCT_EXPORT_METHOD(getSafeArea:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject) {
    UIEdgeInsets inset = [RNTSplashScreen getSafeArea];
    resolve(@{
        @"top": @(inset.top),
        @"bottom": @(inset.bottom),
        @"left": @(inset.left),
        @"right": @(inset.right)
    });
}

@end
