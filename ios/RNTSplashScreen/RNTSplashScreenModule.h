#import <React/RCTBridgeModule.h>
#import <React/RCTRootView.h>

@interface RNTSplashScreenModule : NSObject <RCTBridgeModule>

+ (void)show:(RCTRootView *)rootView;

+ (void)show:(RCTRootView *)rootView image:(NSString *)image;

+ (void)hide;

@end
