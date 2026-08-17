import {NativeModules} from 'react-native';

const LINKING_ERROR =
  `The package '@premiumads/react-native-max-adapter' doesn't seem to be linked. Make sure: \n\n` +
  `- You rebuilt the app after installing the package\n` +
  `- You are not using Expo Go\n`;

const PremiumAdsMaxAdapterNative = NativeModules.PremiumAdsMaxAdapter
  ? NativeModules.PremiumAdsMaxAdapter
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      },
    );

/**
 * Enable or disable verbose logging for the PremiumAds MAX mediation adapter.
 * Call before `AppLovinMAX.initialize()` for best results.
 */
export function setDebug(enabled: boolean): void {
  PremiumAdsMaxAdapterNative.setDebug(!!enabled);
}

export default {setDebug};
