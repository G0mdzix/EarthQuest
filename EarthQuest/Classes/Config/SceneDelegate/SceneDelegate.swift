import UIKit
import ESTabBarController

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  // MARK: - Properties

  var window: UIWindow?
}

// MARK: - Functions

extension SceneDelegate {
  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    configureAppWindow(for: windowScene)
  }

  func sceneDidDisconnect(_ scene: UIScene) {
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
  }

  func sceneWillResignActive(_ scene: UIScene) {
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
  }
}

// MARK: - Private functions

extension SceneDelegate {
  private func configureAppWindow(for windowScene: UIWindowScene) {
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    let navigationController = UINavigationController(
      rootViewController: EarthQuestTabBar.make()
    )
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }
}
