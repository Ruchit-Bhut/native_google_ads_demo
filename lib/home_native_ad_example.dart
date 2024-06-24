// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// class HomeNativeAdExample extends StatefulWidget {
//   const HomeNativeAdExample({super.key});
//
//   @override
//   HomeNativeAdExampleState createState() => HomeNativeAdExampleState();
// }
//
// class HomeNativeAdExampleState extends State<HomeNativeAdExample> {
//   late NativeAd _ad;
//   bool isLoaded = false;
//
//   @override
//   void initState() {
//     super.initState();
//     loadNativeAd();
//   }
//
//   ///Important make sure to dispose the ad when disposing the screen
//   @override
//   void dispose() {
//     _ad.dispose();
//     super.dispose();
//   }
//
//   void loadNativeAd() {
//     _ad = NativeAd(
//         request: const AdRequest(),
//
//         ///This is a test adUnitId make sure to change it
//         adUnitId: 'ca-app-pub-3940256099942544/2247696110',
//         factoryId: Platform.isAndroid?"large":'listtile',
//         listener: NativeAdListener(onAdLoaded: (ad) {
//           setState(() {
//             isLoaded = true;
//           });
//         }, onAdFailedToLoad: (ad, error) {
//           ad.dispose();
//           print('failed to load the ad ${error.message}, ${error.code}');
//         }));
//
//     _ad.load();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Native Ad'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Container(
//           alignment: Alignment.center,
//           height: 300,
//           color: Colors.black12,
//           child: AdWidget(
//             ad: _ad,
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeNativeAdExample extends StatefulWidget {
  const HomeNativeAdExample({super.key});

  @override
  HomeNativeAdExampleState createState() => HomeNativeAdExampleState();
}

class HomeNativeAdExampleState extends State<HomeNativeAdExample> {
  late NativeAd _ad;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    loadNativeAd();
  }

  ///Important make sure to dispose the ad when disposing the screen
  @override
  void dispose() {
    _ad.dispose();
    super.dispose();
  }

  void loadNativeAd() {
    _ad = NativeAd(
        request: const AdRequest(),

        ///This is a test adUnitId make sure to change it
        adUnitId: 'ca-app-pub-3940256099942544/2247696110',
        factoryId: Platform.isAndroid ? "large" : 'nativeAds',
        listener: NativeAdListener(onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('failed to load the ad ${error.message}, ${error.code}');
        }));

    _ad.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Native Ad'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: isLoaded
              ? Container(
            alignment: Alignment.center,
            height: 300,
            color: Colors.black12,
            child: AdWidget(ad: _ad),
          )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
