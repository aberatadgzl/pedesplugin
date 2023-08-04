package com.dbyte.pedes.system.pedessystem;


import android.app.ActivityManager;
import android.content.Context;
import android.os.Build;
import android.os.PowerManager;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;


import java.io.IOException;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** PedessystemPlugin */
public class PedessystemPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context applicationContext;
  private ActivityManager mActivity;

  @Override
  public void onAttachedToEngine(FlutterPluginBinding binding) {
    onAttachedToEngine(binding.getApplicationContext(), binding.getBinaryMessenger());
  }

  private void onAttachedToEngine(Context applicationContext, BinaryMessenger messenger) {
    this.applicationContext = applicationContext;
    channel = new MethodChannel(messenger, "pedessystem");
    channel.setMethodCallHandler(this);
  }


  @RequiresApi(api = Build.VERSION_CODES.M)
  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("goRam")) {
      String a=goRam(mActivity);
      result.success(a);
    } else {
      result.notImplemented();
    }
  }
    @RequiresApi(api = Build.VERSION_CODES.M)
    private String goRam(ActivityManager activity) {
        ActivityManager.MemoryInfo mi = new ActivityManager.MemoryInfo();
        ActivityManager activityManager = (ActivityManager) applicationContext.getSystemService(Context.ACTIVITY_SERVICE);
        activityManager.getMemoryInfo(mi);
        double availableMegs = mi.availMem / 0x100000L;
        Log.i("Berat","kullanılan2"+availableMegs);
    //Percentage can be calculated for API 16+
        double percentAvail = mi.availMem / (double)mi.totalMem * 100.0;
        Log.i("Berat","kullanılan"+mi.availMem);
        Log.i("Berat","total"+mi.totalMem);
        Log.i("Berat","kalan"+percentAvail);
        return ""+percentAvail+"";
    }
  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
