/*
import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
 */

import UIKit
import Flutter
import GoogleMobileAds

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)

        let listTileFactory = ListTileNativeAdFactory()
        FLTGoogleMobileAdsPlugin.registerNativeAdFactory(
            self, factoryId: "listTile", nativeAdFactory: listTileFactory
        )

        let nativeadsFactory = NativeAdsFactory()
        FLTGoogleMobileAdsPlugin.registerNativeAdFactory(
            self, factoryId: "nativeAds", nativeAdFactory: nativeadsFactory
        )

        let homeFactory = HomeNativeAdFactory()
        FLTGoogleMobileAdsPlugin.registerNativeAdFactory(
            self, factoryId: "home", nativeAdFactory: homeFactory
        )

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

//    override func applicationWillTerminate(_ application: UIApplication) {
//        FLTGoogleMobileAdsPlugin.unregisterNativeAdFactory(forId: "listTile")
//        FLTGoogleMobileAdsPlugin.unregisterNativeAdFactory(forId: "nativeAds")
//        FLTGoogleMobileAdsPlugin.unregisterNativeAdFactory(forId: "home")
//    }
}
