
#import "RNTSplashScreenModule.h"
#import "RNTSplashScreen-Swift.h"

@implementation RNTSplashScreenModule

RCT_EXPORT_MODULE(RNTSplashScreen);

+ (void)show {
    [RNTSplashScreen show];
}

+ (void)show:(NSString *)splashScreen inRootView:(RCTRootView *)rootView {
    [RNTSplashScreen showWithSplashScreen:splashScreen rootView:rootView];
}

+ (void)hide {
    [RNTSplashScreen hide];
}

RCT_EXPORT_METHOD(hide) {
    [RNTSplashScreenModule hide];
}

@end
