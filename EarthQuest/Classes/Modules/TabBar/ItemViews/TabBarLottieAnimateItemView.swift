import UIKit
import Lottie
import ESTabBarController

class TabBarLottieAnimateItemView: ESTabBarItemContentView {

  // MARK: - Private Typealiases

  private typealias Builder = LottieAnimateItemViewUIFactory

  // MARK: - Properties

  var lottieAnimationName: EarthQuestLottie = .map

  // MARK: - Subviews

  lazy var lottieView = Builder.makeLottieView(name: lottieAnimationName.rawValue)

  // MARK: - Lifecycle

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(lottieView)
    }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - OverrideFunctions

  override func updateLayout() {
    super.updateLayout()
    lottieView.frame = self.bounds.insetBy(dx: -2, dy: -2)
  }

  override func selectAnimation(animated: Bool, completion: (() -> Void)?) {
    super.selectAnimation(animated: animated, completion: nil)
    lottieView.pause()
  }

  override func deselectAnimation(animated: Bool, completion: (() -> Void)?) {
    super.deselectAnimation(animated: animated, completion: nil)
    lottieView.play()
  }
}

// MARK: - UIFactory

private enum LottieAnimateItemViewUIFactory {
  static func makeLottieView(name: String) -> LottieAnimationView {
    let lottieView = LottieAnimationView(name: name)
    lottieView.loopMode = .loop
    lottieView.contentMode = .scaleAspectFit
    lottieView.play()
    return lottieView
  }
}
