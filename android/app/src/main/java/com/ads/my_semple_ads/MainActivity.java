package com.ads.my_semple_ads;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;

// COMPLETE: Import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngine;

// COMPLETE: Import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin;

public class MainActivity extends FlutterActivity {

    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        // COMPLETE: Register the ListTileNativeAdFactory
        GoogleMobileAdsPlugin.registerNativeAdFactory(flutterEngine, "listTile",
                new ListTileNativeAdFactory(getContext()));


        GoogleMobileAdsPlugin.registerNativeAdFactory(flutterEngine, "medium",
                new Medium(getContext()));

        GoogleMobileAdsPlugin.registerNativeAdFactory(flutterEngine, "large",
                new AdContentLarge(getContext()));

        GoogleMobileAdsPlugin.registerNativeAdFactory(flutterEngine, "banner",
                new AdContentBanner(getContext()));


//        GoogleMobileAdsPlugin.registerNativeAdFactory(flutterEngine, "nativeAds",
//                new NativeAdsFactory(getContext()));


    }

}

