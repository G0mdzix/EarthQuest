
import Foundation
import UIKit
import ESTabBarController

class TabBarBounceAnimationItemView: TabBarBasicItemView {

  // MARK: - Private Typealiases

  private typealias Builder = BounceAnimationItemViewUIFactory

  // MARK: - Lifecycle

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - OverrideFunctions

  override func selectAnimation(animated: Bool, completion: (() -> Void)?) {
    self.bounceAnimation()
    completion?()
  }

  override func reselectAnimation(animated: Bool, completion: (() -> Void)?) {
    self.bounceAnimation()
    completion?()
  }

  // MARK: - PrivateFunctions

  private func bounceAnimation() {
    let impliesAnimation = Builder.makeImpliesAnimation()
    imageView.layer.add(impliesAnimation, forKey: nil)
  }
}

// MARK: - UIFactory

private enum BounceAnimationItemViewUIFactory {
  static func makeImpliesAnimation() -> CAKeyframeAnimation {
    let impliesAnimation = CAKeyframeAnimation(keyPath: KeyPath.impliesAnimationKeyPath)
    impliesAnimation.values = Constants.impliesAnimationValues
    impliesAnimation.duration = Constants.animationDuration
    impliesAnimation.calculationMode = CAAnimationCalculationMode.cubic
    return impliesAnimation
  }
}

// MARK: - KeyPath

private enum KeyPath {
  static let impliesAnimationKeyPath = "transform.scale"
}

// MARK: - Constants

private enum Constants {
  static let animationDuration = 0.6
  static let impliesAnimationValues = [1.0, 1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
}
