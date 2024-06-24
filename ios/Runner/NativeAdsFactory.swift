import google_mobile_ads

class NativeAdsFactory : FLTNativeAdFactory {

    func createNativeAd(_ nativeAd: GADNativeAd,
                        customOptions: [AnyHashable : Any]? = nil) -> GADNativeAdView? {
        let nibView = Bundle.main.loadNibNamed("NativeAdsFactory", owner: nil, options: nil)!.first
        let nativeAdView = nibView as! GADNativeAdView

        (nativeAdView.headlineView as! UILabel).text = nativeAd.headline

        (nativeAdView.bodyView as! UILabel).text = nativeAd.body
        nativeAdView.bodyView!.isHidden = nativeAd.body == nil


        (nativeAdView.iconView as? UIImageView)?.image = nativeAd.icon?.image
        nativeAdView.iconView!.isHidden = nativeAd.icon == nil

        nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent

//        (nativeAdView.iconView as! UIImageView).image = nativeAd.icon?.image
//        nativeAdView.iconView!.isHidden = nativeAd.icon == nil

//        (nativeAdView.iconView as! UIImageView).image = nativeAd.icon?.image
//        nativeAdView.iconView!.isHidden = nativeAd.icon == nil

        nativeAdView.callToActionView?.isUserInteractionEnabled = false

        nativeAdView.nativeAd = nativeAd

        return nativeAdView
    }
}
