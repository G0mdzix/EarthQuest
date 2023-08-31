import Foundation

extension HomeDashboardViewController {
  enum Constants {
    enum Coder {
      static let fatalError = "init(coder:) has not been implemented"
    }

    enum CollectionView {
      static let numberOfItemsInSection = 2
      static let identifier = "HomeDashboardCollectionViewCell"
      static let height: CGFloat = 450
    }
  }
}
