import Foundation
import UIKit

// MARK: - UICollectionViewDataSource

extension HomeDashboardViewController: UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return Constants.CollectionView.numberOfItemsInSection
  }

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: Constants.CollectionView.identifier,
      for: indexPath
    ) as? HomeBadgeCollectionViewCell else {
      return UICollectionViewCell()
    }

    cell.badgeButton.addTarget(self, action: #selector(editCellButton), for: .touchUpInside)
    cell.badgeButton.tag = indexPath.row

    let itemIndex = (indexPath.section * 2) + indexPath.item

    guard let model = modelToDelete else { return UICollectionViewCell() }
    if itemIndex < model.count {
      cell.progressView.setProgress(model[itemIndex].progres, animated: true)
      cell.iconImageView.image = model[itemIndex].image
      cell.titleLabel.text = model[itemIndex].title
    }
    return cell
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return (modelToDelete?.count ?? 2) / 2
  }
}

// MARK: - PrivateFunctions

extension HomeDashboardViewController {
  @objc
  private func editCellButton() {
    print("Edit")
  }
}
