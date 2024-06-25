import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_semple_ads/get_ads_controller/ads_controller.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  var myContr = Get.put(MyController());

  @override
  void initState() {
    super.initState();
    myContr.loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4a536c),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getPlatformIndicator(),
          Obx(
            () => Container(
              child: myContr.isAdLoaded.value
                  ? ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 100,
                        minHeight: 100,
                      ),
                      child: AdWidget(ad: myContr.nativeAd!),
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Widget getPlatformIndicator() {
    if (Platform.isIOS) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.white38,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'lib/assets/steveJobs.jpg',
            scale: 3.5,
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.white38,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'lib/assets/sunderPichai.jpg',
            scale: 2,
          ),
        ),
      );
    }
  }
}
