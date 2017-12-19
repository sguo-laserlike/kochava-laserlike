
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

// #import <React/RCTConvert.h>
// #import <React/RCTLog.h>

#import "RCTEventEmitter.h"
#import "KochavaTracker.h"
@interface RNKochavaLaserlike : RCTEventEmitter <RCTBridgeModule, KochavaTrackerDelegate>

@property(nonatomic, strong) KochavaTracker* kochavaTracker;


@end

