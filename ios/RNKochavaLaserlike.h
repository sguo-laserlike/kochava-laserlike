
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#import <React/RCTConvert.h>
#import <React/RCTLog.h>
#endif

#import "RCTEventEmitter.h"
#import "KochavaTracker.h"
@interface RNKochavaLaserlike : RCTEventEmitter <RCTBridgeModule, KochavaTrackerDelegate>

@property(nonatomic, strong) KochavaTracker* kochavaTracker;


@end

