import Foundation

// MARK: - HomeDashboardViewDelegate

protocol HomeDashboardViewDelegate: AnyObject {
  func takeMockModel(model: [HomeBadgeCellModel]) 
}

// MARK: - HomeDashboardViewCallBack

protocol HomeDashboardViewCallBack: AnyObject {
  func handleViewDidLoad()
  func handleViewWillAppear()
  func handleViewWillDisappear()
  func makeMockBadgeCellModel()
}
