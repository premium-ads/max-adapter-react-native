package net.premiumads.rnmaxadapter

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import net.premiumads.sdk.adapter.max.PremiumAdsAdapter

class PremiumAdsMaxAdapterModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String = NAME

  @ReactMethod
  fun setDebug(enabled: Boolean) {
    PremiumAdsAdapter.setDebug(enabled)
  }

  companion object {
    const val NAME = "PremiumAdsMaxAdapter"
  }
}
