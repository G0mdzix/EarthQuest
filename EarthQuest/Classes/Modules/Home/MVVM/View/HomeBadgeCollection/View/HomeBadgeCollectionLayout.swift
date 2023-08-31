import Foundation
import UIKit

class HomeBadgeCollectionLayout: UICollectionViewFlowLayout {

  // MARK: - Properties
  
  let numberOfColumns: CGFloat = 2
  let cellPadding: CGFloat = 8.0

  // MARK: - Lifecycle

  override func prepare() {
    super.prepare()
    configure()
  }
}

// MARK: - PrivateFunctions

extension HomeBadgeCollectionLayout {
  private func configure() {
    configureSpacings()
    configureSizeAndInset()
  }

  private func configureSpacings() {
    minimumInteritemSpacing = cellPadding * Constants.multiplier
    minimumLineSpacing = cellPadding * Constants.multiplier
  }

  private func configureSizeAndInset() {
    itemSize = CGSize(width: getItemWidth(), height: Constants.height)
    sectionInset = UIEdgeInsets(
      top: cellPadding,
      left: cellPadding,
      bottom: cellPadding,
      right: cellPadding
    )
  }

  private func getItemWidth() -> CGFloat {
    guard let collectionView = collectionView else { return CGFloat() }
    let availableWidth = collectionView.bounds.width - sectionInset.left
    - sectionInset.right - minimumInteritemSpacing * (numberOfColumns - 1)
    return availableWidth / numberOfColumns
  }
}

// MARK: - Constants

private enum Constants {
  static let height: CGFloat = 110
  static let multiplier: CGFloat = 2
}
