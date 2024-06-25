// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_semple_ads/screens/screen_three.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  final List<BannerAd> _bannerAds = [];
  final Random _random = Random();
  InterstitialAd? _interstitialAd;
  bool _isAdLoading = false;
  bool _isBannerAdLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBannerAds();
  }

  void _loadBannerAds() {
    int adsToLoad = 3;
    for (int i = 0; i < adsToLoad; i++) {
      BannerAd bannerAd = BannerAd(
        adUnitId: 'ca-app-pub-3940256099942544/2934735716',
        request: const AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            setState(() {
              _bannerAds.add(ad as BannerAd);
              if (_bannerAds.length == adsToLoad) {
                _isBannerAdLoading = false;
              }
            });
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            ad.dispose();
            if (_bannerAds.length == adsToLoad) {
              _isBannerAdLoading = false;
            }
          },
        ),
      )..load();
    }
  }

  void _loadInterstitialAd() {
    setState(() {
      _isAdLoading = true;
    });

    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/8691691433',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          setState(() {
            _isAdLoading = false;
          });
          _showInterstitialAdAndNavigate();
        },
        onAdFailedToLoad: (LoadAdError error) {
          setState(() {
            _isAdLoading = false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenThree(),
            ),
          );
        },
      ),
    );
  }

  void _showInterstitialAdAndNavigate() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenThree(),
            ),
          );
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenThree(),
            ),
          );
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ScreenThree(),
        ),
      );
    }
  }

  @override
  void dispose() {
    for (var ad in _bannerAds) {
      ad.dispose();
    }
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4a536c),
      appBar: AppBar(
        backgroundColor: const Color(0xff4a536c),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        forceMaterialTransparency: true,
        title: const Text(
          'Second Screen',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
              if (_bannerAds.isNotEmpty && _random.nextInt(10) == 0) {
                int adIndex = _random.nextInt(_bannerAds.length);
                BannerAd bannerAd = _bannerAds[adIndex];
                return _isBannerAdLoading
                    ? Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        height: bannerAd.size.height.toDouble(),
                        width: bannerAd.size.width.toDouble(),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        height: bannerAd.size.height.toDouble(),
                        width: bannerAd.size.width.toDouble(),
                        child: AdWidget(ad: bannerAd),
                      );
              } else {
                return ListTile(
                  onTap: () {
                    _loadInterstitialAd();
                  },
                  title: Text(
                    'Item ${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
            },
          ),
          if (_isAdLoading)
            const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
