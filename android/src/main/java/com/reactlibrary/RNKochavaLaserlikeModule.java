
package com.reactlibrary;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.modules.core.RCTNativeAppEventEmitter;
import com.kochava.base.AttributionListener;
import com.kochava.base.Tracker;
import com.kochava.base.Tracker.Configuration;


public class RNKochavaLaserlikeModule extends ReactContextBaseJavaModule implements AttributionListener{

  private final ReactApplicationContext reactContext;

  public RNKochavaLaserlikeModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNKochavaLaserlike";
  }

  @ReactMethod
  public void init(ReadableMap options, Promise promise){
    try {
      Tracker.configure(new Configuration(this.reactContext)
              .setAppGuid(options.getString("appId"))
              .setLogLevel(options.getBoolean("enableDebug")?Tracker.LOG_LEVEL_DEBUG:Tracker.LOG_LEVEL_WARN)
              .setAttributionListener(this)
      );
      promise.resolve("Done");
    } catch(Exception e){
       promise.reject(e);
    }

  }

  @ReactMethod
  public void attributionDictionary(Promise promise){
    String attributionString = Tracker.getAttribution();
    promise.resolve(attributionString);

  }

  @Override
  public void onAttributionReceived(@NonNull String s) {
    sendEvent(reactContext, "KochavaTrackerDidRetrieveAttributionDictionary", s);
  }

  private void sendEvent(ReactContext reactContext,
                         String eventName,
                         @Nullable String params) {
    reactContext
            .getJSModule(RCTNativeAppEventEmitter.class)
            .emit(eventName, params);
  }
}