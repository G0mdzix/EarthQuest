import Foundation

// MARK: - HomeDashboardPresenterDelegate

protocol HomeDashboardPresenterDelegate: AnyObject {
}

// MARK: - HomeDashboardPresenterCallBack

protocol HomeDashboardPresenterCallBack: AnyObject {
  func performWhenViewDidLoad()
  func performWhenViewWillAppear()
  func performWhenViewWillDisappear()
}
