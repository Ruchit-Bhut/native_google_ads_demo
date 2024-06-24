import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeAdExample extends StatefulWidget {
  const NativeAdExample({super.key});

  @override
  NativeAdExampleState createState() => NativeAdExampleState();
}

class NativeAdExampleState extends State<NativeAdExample> {
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
      factoryId: Platform.isAndroid ? 'large' : 'listTile',
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
      appBar: AppBar(
        title: const Text('Flutter Native Ad'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            if (isLoaded && index == 2) {
              return Container(
                alignment: Alignment.center,
                height: 300,
                color: Colors.black12,
                child: AdWidget(
                  ad: _ad,
                ),
              );
            } else {
              return ListTile(
                title: Text('Item ${index + 1}'),
                leading: const FlutterLogo(
                  size: 25,
                ),
                subtitle: Text('Sub Title for item ${index + 1}'),
              );
            }
          },
        ),
      ),
    );
  }
}
