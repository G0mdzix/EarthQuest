import Foundation
import UIKit

// MARK: - UIScrollViewDelegate

extension HomeDashboardViewController: UIScrollViewDelegate {
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    self.tabBarController?.tabBar.isHidden = true
  }

  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    dispatchScrollViewInteractionUpdate()
  }

  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    dispatchScrollViewInteractionUpdate()
  }
}

// MARK: - UIScrollViewDelegate - PrivateFunctions

extension HomeDashboardViewController {
  @MainActor
  private func dispatchScrollViewInteractionUpdate() {
    Task {
      self.tabBarController?.tabBar.isHidden = false
    }
  }
}
