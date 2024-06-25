// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// class NativeAdFactoryExample extends StatefulWidget {
//   const NativeAdFactoryExample({super.key});
//
//   @override
//   NativeAdFactoryExampleState createState() => NativeAdFactoryExampleState();
// }
//
// class NativeAdFactoryExampleState extends State<NativeAdFactoryExample> {
//   late NativeAd _ad;
//   bool isLoaded = false;
//
//   @override
//   void initState() {
//     super.initState();
//     loadNativeAd();
//   }
//
//   @override
//   void dispose() {
//     _ad.dispose();
//     super.dispose();
//   }
//
//   void loadNativeAd() {
//     _ad = NativeAd(
//       request: const AdRequest(),
//       adUnitId: 'ca-app-pub-3940256099942544/2247696110',
//       factoryId: Platform.isAndroid ? 'banner' : 'nativeAds',
//       listener: NativeAdListener(
//         onAdLoaded: (ad) {
//           setState(() {
//             isLoaded = true;
//           });
//         },
//         onAdFailedToLoad: (ad, error) {
//           ad.dispose();
//           if (kDebugMode) {
//             print('failed to load the ad ${error.message}, ${error.code}');
//           }
//         },
//       ),
//     );
//
//     _ad.load();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff4a536c),
//       appBar: AppBar(
//         backgroundColor: const Color(0xff4a536c),
//         title: const Text(
//           'Flutter Native Ads Factory',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//           child: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: ListView.builder(
//           itemCount: 5,
//           itemBuilder: (context, index) {
//             if (isLoaded && index == 2) {
//               return Container(
//                 alignment: Alignment.center,
//                 height: 100,
//                 color: Colors.black12,
//                 child: AdWidget(
//                   ad: _ad,
//                 ),
//               );
//             } else {
//               return ListTile(
//                 title: Text(
//                   'Item ${index + 1}',
//                   style: const TextStyle(color: Colors.white),
//                 ),
//                 leading: const FlutterLogo(
//                   size: 25,
//                 ),
//                 subtitle: Text(
//                   'Sub Title for item ${index + 1}',
//                   style: const TextStyle(color: Colors.white70),
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdFactoryExample extends StatefulWidget {
  const NativeAdFactoryExample({super.key});

  @override
  NativeAdFactoryExampleState createState() => NativeAdFactoryExampleState();
}

class NativeAdFactoryExampleState extends State<NativeAdFactoryExample> {
  late NativeAd _ad;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    loadNativeAd();
  }

  @override
  void dispose() {
    _ad.dispose();
    super.dispose();
  }

  void loadNativeAd() {
    _ad = NativeAd(
      request: const AdRequest(),
      adUnitId: 'ca-app-pub-3940256099942544/2247696110',
      factoryId: Platform.isAndroid ? 'banner' : 'nativeAds',
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (kDebugMode) {
            print('Failed to load the ad: ${error.message}, ${error.code}');
          }
        },
      ),
    );

    _ad.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4a536c),
      appBar: AppBar(
        backgroundColor: const Color(0xff4a536c),
        title: const Text(
          'Flutter Native Ads Factory',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            if (index == 2) {
              return Container(
                alignment: Alignment.center,
                height: 100,
                color: Colors.black12,
                child: isLoaded
                    ? AdWidget(ad: _ad)
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
              );
            } else {
              return ListTile(
                title: Text(
                  'Item ${index + 1}',
                  style: const TextStyle(color: Colors.white),
                ),
                leading: const FlutterLogo(size: 25),
                subtitle: Text(
                  'Sub Title for item ${index + 1}',
                  style: const TextStyle(color: Colors.white70),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
