import Foundation
import EasyUIBuilder
import UIKit
import ESTabBarController

// MARK: - Builder

enum EarthQuestTabBar {
  static func make() -> ESTabBarController {
    let tabBarController = ESTabBarController()
    tabBarController.viewControllers = makeViewControllers()
    return tabBarController
  }
}

// MARK: - ViewControllersBuilder

extension EarthQuestTabBar {
  private static func makeViewControllers() -> [UIViewController] {
    let viewControllers: [UIViewController] = [
      makeHomeDashboardViewController(),
      makeMapDashboardViewController(),
      makeUserDashboardViewController()
    ]
    return viewControllers
  }

  private static func makeHomeDashboardViewController() -> UIViewController {
    let vc = HomeDashboardAssembly.build()
    vc.tabBarItem = ESTabBarItem.init(
      TabBarBounceAnimationItemView(),
      title: Localizable.homeDashboardTitle,
      image: EasyUIAssets.Images.homeFill.image,
      selectedImage: EasyUIAssets.Images.homeHollow.image
    )
    return vc
  }

  private static func makeMapDashboardViewController() -> UIViewController {
    let vc = HomeDashboardAssembly.build()
    vc.tabBarItem = ESTabBarItem.init(
      TabBarBounceAnimationItemView(),
      title: Localizable.mapDashboardTitle,
      image: EasyUIAssets.Images.mapFill.image,
      selectedImage: EasyUIAssets.Images.mapHollow.image
    )
    return vc
  }

  private static func makeUserDashboardViewController() -> UIViewController {
    let vc = HomeDashboardAssembly.build()
    vc.tabBarItem = ESTabBarItem.init(
      TabBarBounceAnimationItemView(),
      title: Localizable.userDashboardTitle,
      image: EasyUIAssets.Images.userFill.image,
      selectedImage: EasyUIAssets.Images.userHollow.image
    )
    return vc
  }
}

// MARK: - PrivateFunctions

extension EarthQuestTabBar {
  private static func makeLottieTabBarItem(
    vc: UIViewController,
    lottieName: EarthQuestLottie
  ) -> UITabBarItem {
    guard let tabBarItem = vc.tabBarItem else { return UITabBarItem() }
    let lottieView = TabBarLottieAnimateItemView()
    lottieView.lottieAnimationName = lottieName
    vc.tabBarItem = ESTabBarItem.init(
      lottieView,
      title: nil,
      image: nil,
      selectedImage: nil
    )
    return tabBarItem
  }
}

// MARK: - PrivateLocalizable

private enum Localizable {
  static let userDashboardTitle = "Home"
  static let mapDashboardTitle = "Map"
  static let homeDashboardTitle = "User"
}
