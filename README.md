# @premiumads/react-native-max-adapter

PremiumAds custom mediation adapter for [AppLovin MAX](https://www.applovin.com/max/).

Wires the PremiumAds MAX custom adapter into your React Native app's Android and iOS builds so that AppLovin MAX mediation can fill inventory from the PremiumAds network.

## Installation

```bash
npm install @premiumads/react-native-max-adapter
# or
yarn add @premiumads/react-native-max-adapter
```

This package only wires up the native PremiumAds adapter. You also need AppLovin's own React Native MAX SDK, which we recommend installing alongside it:

```bash
npm install react-native-applovin-max
```

### iOS

Nothing extra to configure. `PremiumAdsMaxAdapter` is published on CocoaPods trunk and is pulled in transitively by the wrapper podspec:

```bash
cd ios && pod install
```

### Android

Nothing extra to configure. The wrapper's `build.gradle` already adds the PremiumAds JFrog Maven repository (`https://repo.premiumads.net/artifactory/mobile-ads-sdk/`) and pulls in `net.premiumads.sdk:max-adapter` via autolinking.

## MAX dashboard setup

In the AppLovin MAX dashboard, add PremiumAds as a **Custom Network** with the following:

| Field | Value |
| --- | --- |
| Network name | `PremiumAds Custom Adapter` |
| iOS adapter class | `PremiumAdsAdapter` |
| Android adapter class | `net.premiumads.sdk.adapter.max.PremiumAdsAdapter` |
| Placement / Ad Unit ID | Your PremiumAds ad unit ID |

### Supported ad formats

- Banner
- MREC
- Interstitial
- Rewarded
- Native

> **App Open is not supported** by the PremiumAds MAX adapter.

## Usage

```ts
import {AppLovinMAX} from 'react-native-applovin-max';
import {setDebug} from '@premiumads/react-native-max-adapter';

// Enable verbose logging from the PremiumAds adapter (dev only)
setDebug(__DEV__);

AppLovinMAX.initialize('YOUR_SDK_KEY').then(configuration => {
  console.log('MAX initialized:', configuration);
});
```

Once initialized, use the standard `react-native-applovin-max` APIs (`AppLovinMAX.Banner`, `AppLovinMAX.Interstitial`, `AppLovinMAX.Rewarded`, `AppLovinMAX.Native`, etc.). The PremiumAds adapter will receive ad requests via MAX mediation when your ad units are configured to mediate through PremiumAds in the MAX dashboard.

## Troubleshooting

**"The package '@premiumads/react-native-max-adapter' doesn't seem to be linked"**

- Rebuild the app after installing the package (`npx pod-install` on iOS, a fresh Gradle build on Android). Metro fast refresh alone will not pick up new native modules.
- Confirm you are not running inside Expo Go — this package requires a custom dev client or a bare React Native build, since it ships native code.
- On iOS, make sure `pod install` completed without errors and that `PremiumAdsReactNativeMaxAdapter` shows up in your `Podfile.lock`.
- On Android, make sure autolinking picked up the module — check `android/app/build/generated/autolinking/autolinking.json` for `@premiumads/react-native-max-adapter`.

## Versioning

This JS package is versioned independently from the native adapters. It pins:

- Android: `net.premiumads.sdk:max-adapter:1.0.0`
- iOS: `PremiumAdsMaxAdapter` (via CocoaPods trunk)

## Support

Questions or issues: [contact@premiumads.net](mailto:contact@premiumads.net)

## License

MIT © PremiumAds
