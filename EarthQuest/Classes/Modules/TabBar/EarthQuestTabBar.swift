import Foundation
import EasyUIBuilder
import UIKit

class EarthQuestTabBar: UITabBarController {

  // MARK: - Private Typealiases

  private typealias builder = OnboardingUIFactory

  let layer = CAShapeLayer()
  var layerHeight = CGFloat()

  let bgColor: UIColor = .green
  let sColor: UIColor = .blue
  let tColor: UIColor = .red

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemPink
    UITabBar.appearance().barTintColor = .purple
    tabBar.tintColor = .label
    setupVCs()
    setUpTabBar()
  }

  func setupVCs() {
    viewControllers = [
      createNavController(
        for: HomeDashboardAssembly.build(),
        title: "Home",
        image: UIImage(systemName: "house")!
      ),
      createNavController(
        for: ViewController(),
        title: "TEST",
        image: UIImage(systemName: "person")!
      )
    ]
  }

  func setUpTabBar() {
      // tab bar layer
      let x: CGFloat = 10
      let y: CGFloat = 80
      let width = self.tabBar.bounds.width
      let height = self.tabBar.bounds.height + y
      layerHeight = height

      // Tworzymy zaokrąglony prostokąt tylko dla górnych krawędzi
      let roundedRectPath = getTabBarRoundedRectPath()

      layer.fillColor = bgColor.cgColor
      layer.path = roundedRectPath.cgPath

      // tab bar shadow
      layer.shadowColor = tColor.cgColor
      layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
      layer.shadowRadius = 5.0
      layer.shadowOpacity = 0.5

      // add tab bar layer
      self.tabBar.layer.insertSublayer(layer, at: 0)

      // fix items positioning
      tabBar.itemWidth = width / 6
      tabBar.itemPositioning = .centered
      tabBar.unselectedItemTintColor = sColor
  }

  private func getTabBarRoundedRectPath() -> UIBezierPath {
    return UIBezierPath(
      roundedRect: CGRect(
        x: 0,
        y: UIScreen.main.bounds.minY - 10,
        width: tabBar.bounds.width,
        height: tabBar.bounds.height + 80
      ),
      byRoundingCorners: [.topLeft, .topRight],
      cornerRadii: CGSize(width: 20, height: 20)
    )
  }

  private func createNavController(
    for rootViewController: UIViewController,
    title: String,
    image: UIImage
  ) -> UIViewController {
    let navController = UINavigationController(rootViewController: rootViewController)
    navController.tabBarItem.title = title
    navController.tabBarItem.image = image
    navController.navigationBar.prefersLargeTitles = true
    // rootViewController.navigationItem.title = title
    return navController
  }
}

// MARK: - Constants

private enum Constants {

}

class ViewController: UIViewController {

    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .red
    }
}
