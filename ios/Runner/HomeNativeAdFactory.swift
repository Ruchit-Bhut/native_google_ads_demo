import google_mobile_ads

class HomeNativeAdFactory : FLTNativeAdFactory {

    func createNativeAd(_ nativeAd: GADNativeAd,
                        customOptions: [AnyHashable : Any]? = nil) -> GADNativeAdView? {
        let nibView = Bundle.main.loadNibNamed("HomeNativeAdView", owner: nil, options: nil)!.first
        let nativeAdView = nibView as! GADNativeAdView

        (nativeAdView.headlineView as! UILabel).text = nativeAd.headline

        (nativeAdView.bodyView as! UILabel).text = nativeAd.body
        nativeAdView.bodyView!.isHidden = nativeAd.body == nil


        (nativeAdView.iconView as? UIImageView)?.image = nativeAd.icon?.image
        nativeAdView.iconView!.isHidden = nativeAd.icon == nil

        nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent
        nativeAdView.mediaView?.contentMode = .scaleAspectFit
        
        (nativeAdView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)
        (nativeAdView.callToActionView as? UIButton)?.titleLabel?.adjustsFontSizeToFitWidth = true
        (nativeAdView.callToActionView as? UIButton)?.titleLabel?.minimumScaleFactor = 0.5
        (nativeAdView.callToActionView as? UIButton)?.titleLabel?.numberOfLines = 1
        (nativeAdView.callToActionView as? UIButton)?.titleLabel?.textColor = .white
        nativeAdView.callToActionView?.isHidden = nativeAd.callToAction == nil

        nativeAdView.callToActionView?.isUserInteractionEnabled = false

        nativeAdView.nativeAd = nativeAd

        return nativeAdView
    }
}