import Flutter
import GoogleMobileAds

@objc class ListTileNativeAdFactory: NSObject, FLTNativeAdFactory {
    func createNativeAd(
        _ nativeAd: GADNativeAd,
        customOptions: [AnyHashable : Any]? = nil
    ) -> GADNativeAdView? {
        guard let nibView = Bundle.main.loadNibNamed("ListTileNativeAdView", owner: nil, options: nil)?.first as? GADNativeAdView else {
            return nil
        }

        (nibView.headlineView as? UILabel)?.text = nativeAd.headline
        (nibView.bodyView as? UILabel)?.text = nativeAd.body
        nibView.bodyView?.isHidden = nativeAd.body == nil

        if let icon = nativeAd.icon {
            (nibView.iconView as? UIImageView)?.image = icon.image
            nibView.iconView?.isHidden = false
        } else {
            nibView.iconView?.isHidden = true
        }

        nibView.mediaView?.mediaContent = nativeAd.mediaContent
        nibView.callToActionView?.isUserInteractionEnabled = false
        nibView.nativeAd = nativeAd

        return nibView
    }
}
