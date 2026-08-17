module.exports = {
  dependency: {
    platforms: {
      android: {
        sourceDir: './android',
        packageImportPath: 'import net.premiumads.rnmaxadapter.PremiumAdsMaxAdapterPackage;',
        packageInstance: 'new PremiumAdsMaxAdapterPackage()',
      },
      ios: {},
    },
  },
};
