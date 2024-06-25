import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_semple_ads/native_ads/home_native_ad_example.dart';
import 'package:my_semple_ads/native_ads/native_ad_example.dart';
import 'package:my_semple_ads/native_ads/native_ads_factory_example.dart';
import 'package:my_semple_ads/screens/second_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppOpenAd _appOpenAd;
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;
  InterstitialAd? _interstitialVideoAd;
  RewardedAd? _rewardedAd;
  RewardedInterstitialAd? _rewardedInterstitialAd;
  NativeAd? _nativeAd;
  bool _isBannerAdLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAppOpenAd();
    _loadBannerAd();
    _loadInterstitialAd();
    _loadInterstitialVideoAd();
    _loadRewardedAd();
    _loadRewardedInterstitialAd();
    _loadNativeAd();
  }

  void _loadAppOpenAd() {
    AppOpenAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/3419835294',
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (AppOpenAd ad) {
          _appOpenAd = ad;
          _appOpenAd.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          if (kDebugMode) {
            print('AppOpenAd failed to load: $error');
          }
        },
      ),
    );
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            _isBannerAdLoading = false;
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        },
      ),
    )..load();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {},
      ),
    );
  }

  void _loadInterstitialVideoAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/8691691433',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialVideoAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {},
      ),
    );
  }

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {},
      ),
    );
  }

  void _loadRewardedInterstitialAd() {
    RewardedInterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5354046379',
      request: const AdRequest(),
      rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
        onAdLoaded: (RewardedInterstitialAd ad) {
          _rewardedInterstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {},
      ),
    );
  }

  void _loadNativeAd() {
    NativeAd(
      adUnitId: 'ca-app-pub-3940256099942544/2247696110',
      request: const AdRequest(),
      factoryId: 'adFactoryExample',
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            _nativeAd = ad as NativeAd;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        },
      ),
    ).load();
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null;
      _loadInterstitialAd(); // Reload ad
    }
  }

  void _showInterstitialVideoAd() {
    if (_interstitialVideoAd != null) {
      _interstitialVideoAd!.show();
      _interstitialVideoAd = null;
      _loadInterstitialVideoAd(); // Reload ad
    }
  }

  void _showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {},
      );
      _rewardedAd = null;
      _loadRewardedAd(); // Reload ad
    }
  }

  void _showRewardedInterstitialAd() {
    if (_rewardedInterstitialAd != null) {
      _rewardedInterstitialAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {},
      );
      _rewardedInterstitialAd = null;
      _loadRewardedInterstitialAd(); // Reload ad
    }
  }

  void _showFullPageAdAndNavigate() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null;
      _loadInterstitialAd(); // Reload ad
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondScreen()),
      );
    }
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    _interstitialVideoAd?.dispose();
    _rewardedAd?.dispose();
    _rewardedInterstitialAd?.dispose();
    _nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4a536c),
      appBar: AppBar(
        backgroundColor: const Color(0xff4a536c),
        title: const Text(
          'Google Mobile Ads',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _showInterstitialAd,
                  child: const Text('Show Interstitial Ad'),
                ),
                ElevatedButton(
                  onPressed: _showInterstitialVideoAd,
                  child: const Text('Show Interstitial Video Ad'),
                ),
                ElevatedButton(
                  onPressed: _showRewardedAd,
                  child: const Text('Show Rewarded Ad'),
                ),
                ElevatedButton(
                  onPressed: _showRewardedInterstitialAd,
                  child: const Text('Show Rewarded Interstitial Ad'),
                ),
                ElevatedButton(
                  onPressed: _showFullPageAdAndNavigate,
                  child: const Text('Go to Second Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NativeAdExample(),
                      ),
                    );
                  },
                  child: const Text('Go to Native Ads Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeNativeAdExample(),
                      ),
                    );
                  },
                  child: const Text('Home Native Ads '),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NativeAdFactoryExample(),
                      ),
                    );
                  },
                  child: const Text('Native Ads Factory'),
                ),
              ],
            ),
          ),
          if (_isBannerAdLoading)
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          else if (_bannerAd != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            ),
        ],
      ),
    );
  }
}
