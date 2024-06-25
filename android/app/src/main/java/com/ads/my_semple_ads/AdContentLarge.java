package com.ads.my_semple_ads;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.TextView;
import com.google.android.gms.ads.nativead.MediaView;
import com.google.android.gms.ads.nativead.NativeAd;
import com.google.android.gms.ads.nativead.NativeAdView;
import java.util.Map;

import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin;

class AdContentLarge implements GoogleMobileAdsPlugin.NativeAdFactory {

    private final Context context;

    AdContentLarge(Context context) {
        this.context = context;
    }


    public  NativeAdView createNativeAd(NativeAd nativeAd, Map<String, Object> customOptions) {
        NativeAdView nativeAdView = (NativeAdView) LayoutInflater.from(context)
                .inflate(R.layout.ad_content_large, null);

// icon

         nativeAdView.setIconView(nativeAdView.findViewById(R.id.ad_icon_imageview));
         if (nativeAd.getIcon() == null) {
             nativeAdView.getIconView().setVisibility(View.GONE);
         } else {
             ((ImageView)nativeAdView.getIconView()).setImageDrawable(nativeAd.getIcon().getDrawable());
         }

//  media
        MediaView mediaView = nativeAdView.findViewById(R.id.contentad_image);
        mediaView.setMediaContent(nativeAd.getMediaContent());
        nativeAdView.setMediaView(mediaView);

// button

        nativeAdView.setCallToActionView(nativeAdView.findViewById(R.id.ad_action_button));
        if(nativeAd.getCallToAction()==null){
            nativeAdView.getCallToActionView().setVisibility(View.INVISIBLE);
        }
        else{
            ((Button)nativeAdView.getCallToActionView()).setText(nativeAd.getCallToAction());
        }

//   headline
        nativeAdView.setHeadlineView(nativeAdView.findViewById(R.id.ad_title_textview));
        ((TextView)nativeAdView.getHeadlineView()).setText(nativeAd.getHeadline());

//  bodyView
        nativeAdView.setBodyView(nativeAdView.findViewById(R.id.ad_describe_textview));
        if(nativeAd.getBody()==null){
            nativeAdView.getBodyView().setVisibility(View.INVISIBLE);
        }else {
            ((TextView)nativeAdView.getBodyView()).setText(nativeAd.getBody());
            nativeAdView.getBodyView().setVisibility(View.VISIBLE);
        }

        nativeAdView.setNativeAd(nativeAd);

        return nativeAdView;
    }
}