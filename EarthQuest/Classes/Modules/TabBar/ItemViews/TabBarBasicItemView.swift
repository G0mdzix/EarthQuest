import Foundation
import EasyUIBuilder
import UIKit
import ESTabBarController

class TabBarBasicItemView: ESTabBarItemContentView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    textColor = Constants.textColor
    highlightTextColor = Constants.highlightTextColor
    iconColor = Constants.iconColor
    highlightIconColor = Constants.highlightIconColor
  }

  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Constants

private enum Constants {
  static let textColor: UIColor = EasyUIAssets.Colors.navyPurple.color
  static let highlightTextColor: UIColor = EasyUIAssets.Colors.lightPurple.color
  static let iconColor: UIColor = EasyUIAssets.Colors.navyPurple.color
  static let highlightIconColor: UIColor = EasyUIAssets.Colors.lightPurple.color
}
