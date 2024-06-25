package com.ads.my_semple_ads;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;

import io.flutter.embedding.engine.FlutterEngine;

import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin;

public class MainActivity extends FlutterActivity {

    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        GoogleMobileAdsPlugin.registerNativeAdFactory(flutterEngine, "listTile",
                new ListTileNativeAdFactory(getContext()));


        GoogleMobileAdsPlugin.registerNativeAdFactory(flutterEngine, "medium",
                new Medium(getContext()));

        GoogleMobileAdsPlugin.registerNativeAdFactory(flutterEngine, "large",
                new AdContentLarge(getContext()));

        GoogleMobileAdsPlugin.registerNativeAdFactory(flutterEngine, "banner",
                new AdContentBanner(getContext()));

    }

}

