import Foundation

// MARK: - HomeDashboardViewDelegate

protocol HomeDashboardViewDelegate: AnyObject {}

// MARK: - HomeDashboardViewCallBack

protocol HomeDashboardViewCallBack: AnyObject {
  func handleViewDidLoad()
  func handleViewWillAppear()
  func handleViewWillDisappear()
}

