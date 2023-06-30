//
//  R.generated.swift
//  Cargo
//
//  Created by Adilet on 30/6/23.
//

import Foundation
import UIKit
import RswiftResources

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle
  var color: color { .init(bundle: bundle) }
  var image: image { .init(bundle: bundle) }
  var info: info { .init(bundle: bundle) }
  var font: font { .init(bundle: bundle) }
  var file: file { .init(bundle: bundle) }
  var storyboard: storyboard { .init(bundle: bundle) }

  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func image(bundle: Foundation.Bundle) -> image {
    .init(bundle: bundle)
  }
  func info(bundle: Foundation.Bundle) -> info {
    .init(bundle: bundle)
  }
  func font(bundle: Foundation.Bundle) -> font {
    .init(bundle: bundle)
  }
  func file(bundle: Foundation.Bundle) -> file {
    .init(bundle: bundle)
  }
  func storyboard(bundle: Foundation.Bundle) -> storyboard {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.font.validate()
    try self.storyboard.validate()
  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.color` struct is generated, and contains static references to 8 colors.
// MARK: Colors
  struct color {
    let bundle: Foundation.Bundle
      var backgroundYellow: RswiftResources.ColorResource { .init(name: "BackgroundYellow", path: [], bundle: bundle)}
      var lightYellow: RswiftResources.ColorResource { .init(name: "LightYellow", path: [], bundle: bundle)}
      var goldYellow: RswiftResources.ColorResource { .init(name: "GoldYellow", path: [], bundle: bundle)}
      
//
//    /// Color `yellow`.
//    var yellow: RswiftResources.ColorResource { .init(name: "yellow", path: [], bundle: bundle) }
  }

  /// This `_R.image` struct is generated, and contains static references to 72 images.
// MARK: images
  struct image {
    let bundle: Foundation.Bundle
      var auth: RswiftResources.ImageResource { .init(name: "Auth", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil)}

  }

  /// This `_R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    let bundle: Foundation.Bundle
    var uiApplicationSceneManifest: uiApplicationSceneManifest { .init(bundle: bundle) }

    func uiApplicationSceneManifest(bundle: Foundation.Bundle) -> uiApplicationSceneManifest {
      .init(bundle: bundle)
    }

    struct uiApplicationSceneManifest {
      let bundle: Foundation.Bundle

      let uiApplicationSupportsMultipleScenes: Bool = false

      var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest"], key: "_key") ?? "UIApplicationSceneManifest" }
      var uiSceneConfigurations: uiSceneConfigurations { .init(bundle: bundle) }

      func uiSceneConfigurations(bundle: Foundation.Bundle) -> uiSceneConfigurations {
        .init(bundle: bundle)
      }

      struct uiSceneConfigurations {
        let bundle: Foundation.Bundle
        var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations"], key: "_key") ?? "UISceneConfigurations" }
        var uiWindowSceneSessionRoleApplication: uiWindowSceneSessionRoleApplication { .init(bundle: bundle) }

        func uiWindowSceneSessionRoleApplication(bundle: Foundation.Bundle) -> uiWindowSceneSessionRoleApplication {
          .init(bundle: bundle)
        }

        struct uiWindowSceneSessionRoleApplication {
          let bundle: Foundation.Bundle
          var defaultConfiguration: defaultConfiguration { .init(bundle: bundle) }

          func defaultConfiguration(bundle: Foundation.Bundle) -> defaultConfiguration {
            .init(bundle: bundle)
          }

          struct defaultConfiguration {
            let bundle: Foundation.Bundle
            var uiSceneConfigurationName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneConfigurationName") ?? "Default Configuration" }
            var uiSceneDelegateClassName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate" }
          }
        }
      }
    }
  }

  /// This `_R.font` struct is generated, and contains static references to 7 fonts.
  struct font: Sequence {
    let bundle: Foundation.Bundle
//      var robotoMedium: RswiftResources.FontResource { .init(name: "Roboto-Medium", bundle: bundle, filename: "Roboto_Medium.ttf")}
//      var robotoRegular: RswiftResources.FontResource { .init(name: "Roboto-Regular", bundle: bundle, filename: "Roboto-Regular.ttf")}
//      var robotoBold: RswiftResources.FontResource { .init(name: "Roboto-Bold", bundle: bundle, filename: "Roboto-Bold.ttf")}
//      var robotoLight: RswiftResources.FontResource { .init(name: "Roboto-Light", bundle: bundle, filename: "Roboto-Light.ttf")}
      var semiBold: RswiftResources.FontResource { .init(name: "SFUIDisplay-Semibold", bundle: bundle, filename: "SFSemibold.otf")}
      var bold: RswiftResources.FontResource { .init(name: "SFUIDisplay-Bold", bundle: bundle, filename: "SFBold.otf")}
      var light: RswiftResources.FontResource { .init(name: "SFUIDisplay-Light", bundle: bundle, filename: "SFLight.otf")}
      var medium: RswiftResources.FontResource { .init(name: "SFUIDisplay-Medium", bundle: bundle, filename: "SFMedium.otf")}
      var regular: RswiftResources.FontResource { .init(name: "SFUIDisplay-Thin", bundle: bundle, filename: "SFRegular.otf")}
    func makeIterator() -> IndexingIterator<[RswiftResources.FontResource]> {
      [semiBold,bold,light,medium,regular].makeIterator()
    }
    func validate() throws {
      for font in self {
        if !font.canBeLoaded() { throw RswiftResources.ValidationError("[R.swift] Font '\(font.name)' could not be loaded, is '\(font.filename)' added to the UIAppFonts array in this targets Info.plist?") }
      }
    }
  }

  /// This `_R.file` struct is generated, and contains static references to 9 resource files.
  struct file {
    let bundle: Foundation.Bundle

    /// Resource file `.swiftlint.yml`.
    var swiftlintYml: RswiftResources.FileResource { .init(name: ".swiftlint", pathExtension: "yml", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Commissioner-Black.ttf`.
    var commissionerBlackTtf: RswiftResources.FileResource { .init(name: "Commissioner-Black", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Commissioner-Bold.ttf`.
    var commissionerBoldTtf: RswiftResources.FileResource { .init(name: "Commissioner-Bold", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Commissioner-ExtraBold.ttf`.
    var commissionerExtraBoldTtf: RswiftResources.FileResource { .init(name: "Commissioner-ExtraBold", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Commissioner-Light.ttf`.
    var commissionerLightTtf: RswiftResources.FileResource { .init(name: "Commissioner-Light", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Commissioner-Medium.ttf`.
    var commissionerMediumTtf: RswiftResources.FileResource { .init(name: "Commissioner-Medium", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Commissioner-Regular.ttf`.
    var commissionerRegularTtf: RswiftResources.FileResource { .init(name: "Commissioner-Regular", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `Commissioner-SemiBold.ttf`.
    var commissionerSemiBoldTtf: RswiftResources.FileResource { .init(name: "Commissioner-SemiBold", pathExtension: "ttf", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `GoogleService-Info.plist`.
    var googleServiceInfoPlist: RswiftResources.FileResource { .init(name: "GoogleService-Info", pathExtension: "plist", bundle: bundle, locale: LocaleReference.none) }
  }

  /// This `_R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    let bundle: Foundation.Bundle
    var launchScreen: launchScreen { .init(bundle: bundle) }

    func launchScreen(bundle: Foundation.Bundle) -> launchScreen {
      .init(bundle: bundle)
    }
    func validate() throws {
      try self.launchScreen.validate()
    }

    /// Storyboard `LaunchScreen`.
    struct launchScreen: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UIViewController

      let bundle: Foundation.Bundle

      let name = "LaunchScreen"
      func validate() throws {
        if UIKit.UIColor(named: "blue", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Color named 'blue' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
    }
  }
}

