
#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTRootView.h>

@interface RNTSplashScreenModule : NSObject <RCTBridgeModule>

+ (void)show;

+ (void)show:(NSString *)splashScreen inRootView:(RCTRootView *)rootView;

+ (void)hide;

@end
