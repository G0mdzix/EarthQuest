import Foundation
import UIKit
import EasyUIBuilder

enum HomeBadgeCellUIFactory {
  static func makeIconImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.image = EasyUIAssets.Images.mapHollow.image
    imageView.contentMode = .scaleAspectFill
    return imageView
  }

  static func makeBadgeButton() -> UIButton {
    let button = UIButton(type: .custom) as UIButton
    button.setImage(EasyUIAssets.Images.homeHollow.image, for: UIControl.State.normal)
    return button
  }

  static func makeProgresView() -> UIProgressView {
    let progressView = UIProgressView(progressViewStyle: .bar)
    progressView.setProgress(1, animated: true)
    progressView.trackTintColor = .blue
    progressView.tintColor = .red
    return progressView
  }
}

// MARK: - Models

extension HomeBadgeCellUIFactory {
  static let titleLabelModel = LabelModel(
    textColor: .white,
    font: UIFont.boldSystemFont(ofSize: 19),
    textAlignment: .left
  )
}
