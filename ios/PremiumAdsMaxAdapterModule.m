#import "PremiumAdsMaxAdapterModule.h"

#if __has_include(<PremiumAdsMaxAdapter/PremiumAdsMaxAdapter-Swift.h>)
#import <PremiumAdsMaxAdapter/PremiumAdsMaxAdapter-Swift.h>
#else
@import PremiumAdsMaxAdapter;
#endif

@implementation PremiumAdsMaxAdapterModule

RCT_EXPORT_MODULE(PremiumAdsMaxAdapter)

+ (BOOL)requiresMainQueueSetup {
  return NO;
}

RCT_EXPORT_METHOD(setDebug:(BOOL)enabled) {
  // Dispatch dynamically via NSClassFromString rather than referencing
  // [PremiumAdsAdapter setDebug:] directly. This keeps the call site
  // resilient if the Swift-generated Objective-C symbol for
  // PremiumAdsAdapter ever changes shape, and it never hard-fails the
  // build even in edge cases where the header above wasn't picked up.
  Class adapterClass = NSClassFromString(@"PremiumAdsAdapter");
  SEL selector = NSSelectorFromString(@"setDebug:");
  if (adapterClass && [adapterClass respondsToSelector:selector]) {
    NSMethodSignature *signature = [adapterClass methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = adapterClass;
    invocation.selector = selector;
    [invocation setArgument:&enabled atIndex:2];
    [invocation invoke];
  } else {
    NSLog(@"[PremiumAdsMaxAdapter] PremiumAdsAdapter class not found; make sure the PremiumAdsMaxAdapter framework is linked.");
  }
}

@end
