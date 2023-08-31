import Foundation
import EasyUIBuilder
import UIKit

enum HomeDashboardUIFactory {
  static func makeCollectionView(identifier: String) -> UICollectionView {
    let collectionView = UICollectionView(
      frame: .zero,
      collectionViewLayout: makeUICollectionViewFlowLayout()
    )
    collectionView.backgroundColor = EasyUIAssets.Colors.transparent.color
    collectionView.register(
      HomeBadgeCollectionViewCell.self,
      forCellWithReuseIdentifier: identifier
    )
    collectionView.alwaysBounceHorizontal = true
    return collectionView
  }
}

// MARK: - PrivateFunctions

extension HomeDashboardUIFactory {
  private static func makeUICollectionViewFlowLayout() -> UICollectionViewFlowLayout {
    let layout = HomeBadgeCollectionLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = Constants.flowLayoutSpacing
    return layout
  }
}

// MARK: - Constants

private enum Constants {
  static let flowLayoutSpacing: CGFloat = 10
}
