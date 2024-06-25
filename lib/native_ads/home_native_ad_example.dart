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

  @override
  void dispose() {
    _ad.dispose();
    super.dispose();
  }

  void loadNativeAd() {
    _ad = NativeAd(
      request: const AdRequest(),
      adUnitId: 'ca-app-pub-3940256099942544/2247696110',
      factoryId: Platform.isAndroid ? "large" : 'nativeAds',
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('failed to load the ad ${error.message}, ${error.code}');
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
          'Flutter Home Native Ad',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
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
        child: Center(
          child: isLoaded
              ? Container(
                  alignment: Alignment.center,
                  height: 300,
                  color: Colors.black12,
                  child: AdWidget(ad: _ad),
                )
              : const CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
