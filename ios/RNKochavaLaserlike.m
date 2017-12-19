
#import "RNKochavaLaserlike.h"
//#import <React/RCTConvert.h>
//#import <React/RCTLog.h>

@implementation RNKochavaLaserlike

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE();

RCT_REMAP_METHOD(init,
                 options: (NSDictionary *)options
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    BOOL enableDebug = [RCTConvert BOOL:options[@"enableDebug"]];
    NSString *appId = [RCTConvert NSString:options[@"appId"]];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSMutableDictionary *trackerParametersDictionary = [NSMutableDictionary dictionary];
        trackerParametersDictionary[kKVAParamAppGUIDStringKey] = appId;
        trackerParametersDictionary[kKVAParamRetrieveAttributionBoolKey] = @(YES);
        if (enableDebug) {
            trackerParametersDictionary[kKVAParamLogLevelEnumKey] = kKVALogLevelEnumDebug;
        }
        [KochavaTracker.shared configureWithParametersDictionary:trackerParametersDictionary delegate:self];
    });
    RCTLogInfo(@"RNKochavaLaserlike init %@", options);
    resolve(@"completed");
}

RCT_REMAP_METHOD(attributionDictionary,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    NSDictionary *dict = [KochavaTracker.shared attributionDictionary];
    resolve(dict);
}


#pragma mark - KochavaTrackerDelegate
- (void)tracker:(nonnull KochavaTracker *)tracker didRetrieveAttributionDictionary:(nonnull NSDictionary *)attributionDictionary
{
    RCTLogInfo(@"RNKochavaLaserlike didRetrieveAttributionDictionary", attributionDictionary);
    [self sendEventWithName:@"KochavaTrackerDidRetrieveAttributionDictionary" body:attributionDictionary];
}

- (NSArray<NSString *> *)supportedEvents {
    return @[@"KochavaTrackerDidRetrieveAttributionDictionary"];
}

@end

